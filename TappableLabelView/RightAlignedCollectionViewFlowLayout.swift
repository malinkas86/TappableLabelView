//
//  RightAlignedCollectionViewFlowLayout.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/18/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import UIKit

final class RightAlignCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }

        var rightMargin = sectionInset.right
        maxY = -1.0
        var attributeMap: [[UICollectionViewLayoutAttributes]] = []
        var rowAttributes: [UICollectionViewLayoutAttributes] = []
        var rightMargins: [CGFloat] = []

        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                rightMargin = sectionInset.right
            }
            if maxY != layoutAttribute.frame.maxY {
                rightMargins.append(rect.width - rightMargin - (rowAttributes.last?.frame.maxX ?? 0))
                attributeMap.append(rowAttributes)
                rowAttributes = []
            }
            rowAttributes.append(layoutAttribute)
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }

        attributeMap.append(rowAttributes)
        rightMargins.append(rect.width - rightMargin - (rowAttributes.last?.frame.maxX ?? 0))
        attributeMap.remove(at: 0)
        rightMargins.remove(at: 0)

        var updatedAttributes: [UICollectionViewLayoutAttributes] = []
        for attributeList in attributeMap.enumerated() {
            let index = attributeList.offset
            for attribute in attributeList.element {
                attribute.frame.origin.x += rightMargins[index]
                updatedAttributes.append(attribute)
            }
        }
        return updatedAttributes
    }

}
