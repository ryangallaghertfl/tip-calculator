//
//  ResultView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 17/12/2023.
//

import UIKit

class ResultView: UIView {
    private let headerLabel: UILabel = {
        LabelFactory.build(
            text: "Total p/person",
            font: ThemeFont.demibold(ofSize: 18))
    }()
    
    private let amountPerPersonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.bold(ofSize: 48)
            ])
        text.addAttributes([
            .font: ThemeFont.bold(ofSize: 24)
        ], range: NSMakeRange(0, 1))
        label.attributedText = text
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    private func layout() {
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
