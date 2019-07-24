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
    ///   - tappableLabelView: Relavant tappable label view
    ///   - text: Tapped text
    ///   - indexInText: Tapped index in the provided text
    ///   - index: Index of the provided tappable strings list
    func didTap(tappableLabelView: TappableLabelView, text: String, indexInText: Int, index: Int)

}
