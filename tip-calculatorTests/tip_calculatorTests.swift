//
//  tip_calculatorTests.swift
//  tip-calculatorTests
//
//  Created by Ryan Gallagher on 16/12/2023.
//

import XCTest
import Combine
@testable import tip_calculator

final class tip_calculatorTests: XCTestCase {
    
    private var sut: CalculatorVM!
    private var cancellables: Set<AnyCancellable>!
    
    private let logoViewTapSubject = PassthroughSubject<Void, Never>()

    override func setUp() {
        sut = .init()
        cancellables = .init()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        cancellables = nil
    }
    
    func test_Result_givenNoTip_1Person_amount100_totalPerPerson_shouldBe100() {
        
        let bill: Double = 100.00
        let tip: Tip = .none
        let split: Int = 1
        let mockInput = fakeBuildInput(bill: bill, tip: tip, split: split)
        
        let vmOutput = sut.transform(inputFromVC: mockInput)
        
        vmOutput.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }.store(in: &cancellables)
    }

        //mocks the input from a VC
    private func fakeBuildInput(bill: Double, tip: Tip, split: Int) -> CalculatorVM.InputFromVC {
        return .init(
            billPublisher: Just(bill).eraseToAnyPublisher(),
            tipPublisher: Just(tip).eraseToAnyPublisher(),
            splitPublisher: Just(split).eraseToAnyPublisher(),
            logoViewTapPublisher: logoViewTapSubject.eraseToAnyPublisher()
        )
    }
}
