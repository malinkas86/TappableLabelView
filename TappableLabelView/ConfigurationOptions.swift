//
//  ConfigurationOptions.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/19/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import Foundation

public class ConfigurationOptions {

    public let textAttributes: [NSAttributedString.Key: Any]
    public let alignment: TextAlignment
    public let isUnderline: Bool
    public let wordSpacing: CGFloat
    public let lineSpacing: CGFloat
    public weak var delegate: TappableLabelViewDelegate?

    public init(textAttributes: [NSAttributedString.Key: Any],
                alignment: TextAlignment,
                isUnderline: Bool = false,
                wordSpacing: CGFloat = 5,
                lineSpacing: CGFloat = 6,
                delegate: TappableLabelViewDelegate) {
        self.textAttributes = textAttributes
        self.alignment = alignment
        self.isUnderline = isUnderline
        self.wordSpacing = wordSpacing
        self.lineSpacing = lineSpacing
        self.delegate = delegate
    }

}
