//
//  HeaderView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 18/12/2023.
//

import UIKit

class HeaderView: UIView {
    
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
