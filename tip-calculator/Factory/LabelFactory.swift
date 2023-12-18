//
//  LabelFactory.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 18/12/2023.
//

import UIKit

struct LabelFactory {
    
    static func build(text: String?, 
                      font: UIFont,
                      backgroundColour: UIColor = .clear,
                      textColour: UIColor = ThemeColour.text,
                      textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.backgroundColor = backgroundColour
        label.textColor = textColour
        label.textAlignment = textAlignment
        return label
    }
}
