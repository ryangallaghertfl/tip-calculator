//
//  BillInputView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 17/12/2023.
//

import UIKit

class BillInputView: UIView {
    
    private let headerView: HeaderView = {
        return HeaderView()
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    private func layout() {
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
