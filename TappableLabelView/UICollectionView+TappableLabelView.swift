//
//  UICollectionView+TappableLabelView.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/19/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import UIKit

extension UICollectionView {

    /// Dequeues and returns a specific collection view cell type for the given index path.
    ///
    /// This call crashes the app if the given cell type can not be dequeued for its own class name.
    ///
    /// - Parameter indexPath: Index path for which to dequeue the cell.
    /// - Returns: Collection view cell of the expected type.
    public func dequeueCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Unexpected cell type. Expected \(T.self) for identifier \(T.self)")
        }
        return cell
    }

    /// Registers list of nib objects containing a cell with the table view under a specified identifier.
    ///
    /// - Parameter cells: List of UITableViewCell types created as nibs to register
    public func registerNibForCells(_ cells: [UICollectionViewCell.Type]) {
        cells.forEach {
            let name = String(describing: $0.self)
            register(UINib(nibName: name, bundle: Bundle(for: $0.self)), forCellWithReuseIdentifier: name)
        }
    }

}
