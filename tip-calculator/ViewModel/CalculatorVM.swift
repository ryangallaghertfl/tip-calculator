//
//  CalculatorVM.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 19/12/2023.
//

import Foundation
import Combine

class CalculatorVM {
    
    struct InputFromVC {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct OutputToView {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func transform(inputFromVC: InputFromVC) -> OutputToView {
        let updateViewPublisher = Publishers.CombineLatest3(
            inputFromVC.billPublisher,
            inputFromVC.tipPublisher,
            inputFromVC.splitPublisher).flatMap { [unowned self] (bill, tip, split) in
            let totalTip = getTipAmount(bill: bill, tip: tip)
            let totalBill = bill + totalTip
            let amountPerPerson = totalBill / Double(split)
            let result = Result(
                amountPerPerson: amountPerPerson,
                totalBill: totalBill,
                totalTip: totalTip)
            return Just(result)
            }.eraseToAnyPublisher()
        
        return OutputToView(updateViewPublisher: updateViewPublisher)
    }
    
    private func getTipAmount(bill: Double, tip: Tip) -> Double {
        switch tip {
        case .none:
            return 0
        case .tenPercent:
            return bill * 0.1
        case .fifteenPercent:
            return bill * 0.15
        case .twentyPercent:
            return bill * 0.2
        case .custom(value: let value):
            return Double(value)
        }
    }
}
