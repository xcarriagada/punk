//
//  ErrorView.swift
//  Punk
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation
import UIKit
import Lottie

class ErrorView: UIView {
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.apply(text: "Sorry, there was a problem. Please try again later", withStyle: .body)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    lazy var lottieAnimationView: LottieAnimationView = {
        let lottieAnimationView = LottieAnimationView.init(name: "alert")
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.animationSpeed = 0.5
        return lottieAnimationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation() {
        lottieAnimationView.play()
    }
    
    func stopAnimation() {
        lottieAnimationView.stop()
    }
}

extension ErrorView: ViewSetupable {
    
    func setup() {
        addSubview(messageLabel)
        addSubview(lottieAnimationView)
    }
    
    func setupConstraints() {
        setupMessageLabelConstraints()
        setupLottieAnimationView()
    }
    
    private func setupMessageLabelConstraints() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupLottieAnimationView() {
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lottieAnimationView.bottomAnchor.constraint(equalTo: messageLabel.topAnchor),
            lottieAnimationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lottieAnimationView.widthAnchor.constraint(equalToConstant: 120),
            lottieAnimationView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
