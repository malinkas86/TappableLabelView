//
//  TappableLabelCell.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/18/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import UIKit

class TappableLabelCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var label: UILabel!

    var textAttributes:  [NSAttributedString.Key: Any]?

    var cellHeight: CGFloat = 0
    var bottomLine: CALayer?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(_ value: String, isUnderlined: Bool) {
        guard let textAttributes = textAttributes else {
            return
        }
        label.attributedText = NSAttributedString(string: value, attributes: textAttributes)
        if isUnderlined {
            if bottomLine == nil {
                bottomLine = CALayer()
            }
            bottomLine?.frame = CGRect(x: 0.0, y: cellHeight - 1, width: 200, height: 1.0)
            bottomLine?.backgroundColor = (textAttributes[NSAttributedString.Key.foregroundColor] as? UIColor)?.cgColor
            containerView.layer.addSublayer(bottomLine ?? CALayer())
        } else {
            bottomLine?.removeFromSuperlayer()
        }
    }

}
