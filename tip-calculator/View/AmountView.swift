//
//  AmountView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 18/12/2023.
//

import UIKit

class AmountView: UIView {
    
    private let titleLabel: UILabel = {
        LabelFactory.build(text: "total bill",
                           font: ThemeFont.regular(ofSize: 18),
                           textColour: ThemeColour.text,
                           textAlignment: .left)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    private func layout() {
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

