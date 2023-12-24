//
//  tip_calculatorUITests.swift
//  tip-calculatorUITests
//
//  Created by Ryan Gallagher on 16/12/2023.
//

import XCTest

final class tip_calculatorUITests: XCTestCase {

    private var app: XCUIApplication!
    
    private var screen: CalculatorScreen {
        CalculatorScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func test_ResultViewDefaultValues_AmountPerPersonShouldBeZero() {
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£0")
    }
    
    func test_ResultViewDefaultValues_TotalBillValueShouldBeZero() {
        XCTAssertEqual(screen.totalBillValueLabel.label, "£0")
    }

}
