//
//  SubtitleView.swift
//  Punk
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation
import UIKit

class SubtitleView: UIView {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var detailTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(withText text: String, andDetailText detailText: String) {
        updateTextLabel(withText: text)
        updateDetailTextLabel(withText: detailText)
    }
    
    private func updateTextLabel(withText text: String) {
        textLabel.apply(text: text, withStyle: .h3)
    }
    
    private func updateDetailTextLabel(withText text: String) {
        detailTextLabel.apply(text: text, withStyle: .body)
    }
}

extension SubtitleView: ViewSetupable {
    
    func setup() {
        addSubview(textLabel)
        addSubview(detailTextLabel)
    }
    
    func setupConstraints() {
        setupTextLabelConstraints()
        setupDetailTextLabelConstraints()
    }
    
    private func setupTextLabelConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupDetailTextLabelConstraints() {
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
            detailTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
