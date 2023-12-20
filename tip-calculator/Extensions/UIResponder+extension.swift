//
//  UIResponder+extension.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 20/12/2023.
//

import Foundation
import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
