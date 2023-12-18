//
//  AmountView.swift
//  tip-calculator
//
//  Created by Ryan Gallagher on 18/12/2023.
//

import UIKit

class AmountView: UIView {
    
    private let title: String
    private let textAlignment: NSTextAlignment
    
    private lazy var titleLabel: UILabel = {
        LabelFactory.build(
            text: title,
            font: ThemeFont.regular(ofSize: 18),
            textColour: ThemeColour.text,
            textAlignment: textAlignment)
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = ThemeColour.primary
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.bold(ofSize: 24)
            ])
            text.addAttributes([
                .font: ThemeFont.bold(ofSize: 16)], range: NSMakeRange(0, 1))
            label.attributedText = text
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        titleLabel,
        amountLabel
        ])
        stackView.axis = .vertical
        return stackView
    }()
    
    init(title: String, textAlignment: NSTextAlignment) {
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        layout()
    }
    
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

