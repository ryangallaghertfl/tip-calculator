//
//  ThemeFont.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 17/12/2023.
//

// source from developer.apple.com/fonts/system-fonts/
import UIKit

struct ThemeFont {
    //avenir next
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func demibold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? .systemFont(ofSize: size)
    }
}
