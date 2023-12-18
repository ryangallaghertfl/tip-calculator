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
    
    private let horizontalLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColour.separator
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        headerLabel,
        amountPerPersonLabel,
        horizontalLineView,
        hStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        AmountView(),
        UIView(),
        AmountView()
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
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

class AmountView: UIView {
    
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
