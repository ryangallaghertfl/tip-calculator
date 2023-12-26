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
    
    func test_ResultViewDefaultValues_TotalTipValueShouldBeZero() {
        XCTAssertEqual(screen.totalTipValueLabel.label, "£0")
    }
    
    func test_GivenEnterBill100_Given1Person_GivenNoTip_TipShouldBe0_TotalShouldBe100_PerPersonShouldBe100() {
        screen.enterBill(amount: 100)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£100")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£100")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£0")
    }

    func test_GivenEnterBill100_Given1Person_GivenTip10percent_TipShouldBe10_TotalShouldBe110_PerPersonShouldBe110() {
        screen.enterBill(amount: 100)
        screen.selectTip(tip: .tenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£110")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£110")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£10")
    }
    
    func test_GivenEnterBill100_Given1Person_GivenTip15percent_TipShouldBe15_TotalShouldBe115_PerPersonShouldBe115() {
        screen.enterBill(amount: 100)
        screen.selectTip(tip: .fifteenPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£115")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£115")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£15")
    }
    
    func test_GivenEnterBill100_Given1Person_GivenTip20percent_TipShouldBe20_TotalShouldBe120_PerPersonShouldBe120() {
        screen.enterBill(amount: 100)
        screen.selectTip(tip: .twentyPercent)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£120")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£20")
    }
    
    func test_GivenTapIncrementButton3Times_as120DividedByFourPeople_PerPersonShouldBe30() {
        screen.enterBill(amount: 100)
        screen.selectTip(tip: .twentyPercent)
        // 1 person
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£120")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£20")
        
        //tap 3 times - 4 people
        screen.selectIncrementButton(numberOfTaps: 3)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£30")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£20")
    }
    
    func test_GivenTapIncrementButton3Times_thenDecrementButton2Times_as120DividedBy2_PerPersonShouldBe60() {
        screen.enterBill(amount: 100)
        screen.selectTip(tip: .twentyPercent)
        //tap increment 3 times - 4 people
        screen.selectIncrementButton(numberOfTaps: 3)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£30")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£20")
        
        //tap decrement 2 times - 2 people
        screen.selectDecrementButton(numberOfTaps: 2)
        XCTAssertEqual(screen.totalAmountPerPersonValueLabel.label, "£60")
        XCTAssertEqual(screen.totalBillValueLabel.label, "£120")
        XCTAssertEqual(screen.totalTipValueLabel.label, "£20")
    }
    

}
