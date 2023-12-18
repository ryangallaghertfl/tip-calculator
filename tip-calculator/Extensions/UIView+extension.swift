//
//  UIView+extension.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 18/12/2023.
//

import UIKit

extension UIView {
    
    func addShadow(offset: CGSize, colour: UIColor, radius: CGFloat, opacity: Float) {
        layer.cornerRadius = radius
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = colour.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        let backgroundCGColour = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColour
    }
}
