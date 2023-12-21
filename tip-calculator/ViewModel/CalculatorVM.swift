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
        

        
        let result = Result(amountPerPerson: 500, totalBill: 1000, totalTip: 50.0)
        
        return OutputToView(updateViewPublisher: Just(result).eraseToAnyPublisher())
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
