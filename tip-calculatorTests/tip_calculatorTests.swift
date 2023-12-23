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
    private var audioPlayerService: MockAudioPlayerService!

    override func setUp() {
        audioPlayerService = .init()
        sut = .init(audioPlayerService: audioPlayerService)
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
    
    func test_Result_givenNoTip_2People_amount100_totalPerPerson_shouldBe50() {
        
        let bill: Double = 100.00
        let tip: Tip = .none
        let split: Int = 2
        let mockInput = fakeBuildInput(bill: bill, tip: tip, split: split)
        
        let vmOutput = sut.transform(inputFromVC: mockInput)
        
        vmOutput.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 50)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }.store(in: &cancellables)
    }
    
    func test_Result_givenTenpercentTip_2People_amount100_totalPerPerson_shouldBe55() {
        
        let bill: Double = 100.00
        let tip: Tip = .tenPercent
        let split: Int = 2
        let mockInput = fakeBuildInput(bill: bill, tip: tip, split: split)
        
        let vmOutput = sut.transform(inputFromVC: mockInput)
        
        vmOutput.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 55)
            XCTAssertEqual(result.totalBill, 110)
            XCTAssertEqual(result.totalTip, 10)
        }.store(in: &cancellables)
    }
    
    func test_Result_givenCustomTip201_4People_amount200_totalPerPerson_shouldBe100pounds25pence() {
        
        let bill: Double = 200.00
        let tip: Tip = .custom(value: 201)
        let split: Int = 4
        let mockInput = fakeBuildInput(bill: bill, tip: tip, split: split)
        
        let vmOutput = sut.transform(inputFromVC: mockInput)
        
        vmOutput.updateViewPublisher.sink { result in
            XCTAssertEqual(result.amountPerPerson, 100.25)
            XCTAssertEqual(result.totalBill, 401)
            XCTAssertEqual(result.totalTip, 201)
        }.store(in: &cancellables)
    }
    
    func test_whenLogoView_tapped_soundFileShouldPlay_calculatorShouldReset() {
        
        let input = fakeBuildInput(bill: 100, tip: .tenPercent, split: 2)
        let output = sut.transform(inputFromVC: input)
        let firstExpectation = XCTestExpectation(description: "reset calculator called")
        let secondExpectation = audioPlayerService.expectation
        
        output.resetCalculatorPublisher.sink { _ in
            firstExpectation.fulfill()
        }.store(in: &cancellables)
        
        logoViewTapSubject.send()
        wait(for: [firstExpectation, secondExpectation], timeout: 1.0)
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

class MockAudioPlayerService: AudioPlayerService {
    var expectation = XCTestExpectation(description: "playSound is called")
    func playSound() {
        expectation.fulfill()
    }
}
