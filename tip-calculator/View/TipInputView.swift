//
//  TipInputView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 17/12/2023.
//

import UIKit

class TipInputView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    private func layout() {
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
