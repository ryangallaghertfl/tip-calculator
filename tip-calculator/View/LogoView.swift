//
//  LogoView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 17/12/2023.
//

import UIKit

class LogoView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    private func layout() {
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
