//
//  TappableLabelViewDelegate.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/18/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import Foundation

/// Description
public protocol TappableLabelViewDelegate: class {

    /// Will be invoked when a tappable text is tapped
    ///
    /// - Parameters:
    ///   - text: Tapped text
    ///   - indexInText: Tapped index in the provided text
    ///   - index: Index of the provided tappable strings list
    func didTap(text: String, indexInText: Int, index: Int)

}
