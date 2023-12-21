//
//  Double+extension.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 21/12/2023.
//

import Foundation

extension Double {
    var currencyFormatted: String {
        //checks whether double is whole number, if zero then true
        //checks that number is a normal number (not zero, NaaN, infinity etc)
        //checks to see if number is equal to rounded version of itself
        var isWholeNumber: Bool {
            isZero ? true: !isNormal ? false: self == rounded()
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        //fraction digits depends if value is a whole number (0) otherwise (2)
        formatter.minimumFractionDigits = isWholeNumber ? 0 : 2
        //attempts to cast to string otherwise nil
        return formatter.string(for: self) ?? ""
    }
}
