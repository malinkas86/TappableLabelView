//
//  ConfigurationOptions.swift
//  TappableLabelView
//
//  Created by Malinka S on 7/19/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import Foundation

/// Configuration options
public class ConfigurationOptions {

    /// Regular Text attributes
    public var textAttributes: [NSAttributedString.Key: Any]
    
    /// Highlighted text attributes
    public var highlightedTextAttributes: [NSAttributedString.Key: Any]
    
    /// Text alignment
    public let alignment: TextAlignment
    
    /// Should underline text or not
    public let isUnderline: Bool
    
    /// Spacing between the words
    public let wordSpacing: CGFloat
    
    /// Line spacing
    public let lineSpacing: CGFloat
    
    /// Delegate to handle tap events
    public weak var delegate: TappableLabelViewDelegate?

    public init(textAttributes: [NSAttributedString.Key: Any],
                highlightedTextAttributes: [NSAttributedString.Key: Any],
                alignment: TextAlignment,
                isUnderline: Bool = false,
                wordSpacing: CGFloat = 5,
                lineSpacing: CGFloat = 6,
                delegate: TappableLabelViewDelegate) {
        self.textAttributes = textAttributes
        self.textAttributes.removeValue(forKey: NSAttributedString.Key.underlineStyle)
        self.textAttributes.removeValue(forKey: NSAttributedString.Key.underlineColor)
        self.highlightedTextAttributes = highlightedTextAttributes
        self.highlightedTextAttributes.removeValue(forKey: NSAttributedString.Key.underlineStyle)
        self.highlightedTextAttributes.removeValue(forKey: NSAttributedString.Key.underlineColor)
        self.alignment = alignment
        self.isUnderline = isUnderline
        self.wordSpacing = wordSpacing
        self.lineSpacing = lineSpacing
        self.delegate = delegate
    }

}
