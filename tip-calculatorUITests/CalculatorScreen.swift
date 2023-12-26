//
//  CalculatorScreen.swift
//  tip-calculatorUITests
//
//  Created by Ryan Gallagher on 24/12/2023.
//

import XCTest

class CalculatorScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    //MARK: LogoView element
    //returns entire logoView
    var logoView: XCUIElement {
        return app.otherElements[ScreenIdentifier.LogoView.logoView.rawValue]
    }
    
    
    //MARK: ResultView elements
    //staticTexts refers to labels
    var totalAmountPerPersonValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalAmountPerPersonValueLabel.rawValue]
    }
    
    var totalBillValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalBillValueLabel.rawValue]
    }
    
    var totalTipValueLabel: XCUIElement {
        return app.staticTexts[ScreenIdentifier.ResultView.totalTipValueLabel.rawValue]
    }
    
    //MARK: BillInputView
    var billInputViewTextField: XCUIElement {
        return app.textFields[ScreenIdentifier.BillInputView.textField.rawValue]
    }
    
    //MARK: TipInputView
    
    var tenPercentTipButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.tenPercentButton.rawValue]
    }
    
    var fifteenPercentTipButton: XCUIElement {
        return app.buttons[ScreenIdentifier.TipInputView.fifteenPercentButton.rawValue]
    }
}

