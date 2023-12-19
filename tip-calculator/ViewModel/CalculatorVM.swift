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
        
    }
}
