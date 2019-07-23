//
//  TappableLabelView.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/18/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import UIKit

public class TappableLabelView: UIView {

    private var collectionView: UICollectionView!

    public var options: ConfigurationOptions? {
        didSet {
            setuSubViews()
        }
    }

    private var cellHeight: CGFloat = 0

    public var text: String? {
        didSet {
            guard options != nil else {
                return
            }
            textArray = text?.components(separatedBy: " ") ?? []
            collectionView.reloadData()
        }
    }

    public var tappableStrings: [String]? {
        didSet {
            guard let tappableStrings = tappableStrings else {
                return
            }
            indexes = []
            for tappableString in tappableStrings.enumerated() {
                let newIndexes: [Int: Int] = textArray.enumerated().filter({ tappableString.element == $0.element }).reduce([:], { (dict, element) -> [Int: Int] in
                    var dict = dict
                    dict[element.offset] = tappableString.offset
                    return dict
                })
                indexes.append(newIndexes)
            }
        }
    }

    private var indexes: [[Int: Int]] = []

    private var textArray: [String] = []

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setuSubViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setuSubViews()
    }

    private func setuSubViews() {
        guard options != nil else {
            return
        }
        initCollectionView()
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }

    private func initCollectionView() {
        guard let options = options else {
            return
        }
        var layout: UICollectionViewFlowLayout
        switch options.alignment {
        case .left:
            layout = LeftAlignedCollectionViewFlowLayout()
        case .right:
            layout = RightAlignCollectionViewFlowLayout()
        default:
            layout = UICollectionViewFlowLayout()
        }
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = options.lineSpacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.collectionViewLayout = layout
        collectionView.allowsMultipleSelection = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNibForCells([TappableLabelCell.self])
        collectionView.reloadData()
    }
    
    private func textIndex(at index: Int) -> Int? {
        return indexes.filter({ $0[index] != nil }).first?[index]
    }

}

// MARK: - UICollectionViewDataSource
extension TappableLabelView: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArray.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TappableLabelCell = collectionView.dequeueCell(forIndexPath: indexPath)
        cell.cellHeight = cellHeight
        let tappableText = textIndex(at: indexPath.row)
        cell.textAttributes = tappableText != nil ? options?.highlightedTextAttributes : options?.textAttributes
        var isUnderline = options?.isUnderline ?? false
        if isUnderline {
            isUnderline = tappableText != nil
        }

        cell.set(textArray[indexPath.row], isUnderlined: isUnderline)
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension TappableLabelView: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = textArray[indexPath.row].size(withAttributes: options?.textAttributes)
        cellHeight = size.height
        return CGSize(width: size.width + (options?.wordSpacing ?? 0), height: size.height)
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedItem = textIndex(at: indexPath.row) {
            options?.delegate?.didTap(text: textArray[indexPath.row], indexInText: indexPath.row, index: selectedItem)
        }
    }

}
