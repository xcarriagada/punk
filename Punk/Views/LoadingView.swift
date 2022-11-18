//
//  LoadingView.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import Foundation
import UIKit
import Lottie

class LoadingView: UIView {
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    lazy var lottieAnimationView: LottieAnimationView = {
        let lottieAnimationView = LottieAnimationView.init(name: "waiting")
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.animationSpeed = 0.5
        return lottieAnimationView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(messageLabel)
        addSubview(lottieAnimationView)
    }
    
    private func setupConstraints() {
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
            lottieAnimationView.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: 60),
            lottieAnimationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lottieAnimationView.widthAnchor.constraint(equalToConstant: 300),
            lottieAnimationView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func startLoading() {
        lottieAnimationView.play()
    }
    
    func stopLoading() {
        lottieAnimationView.stop()
    }
    
    func updateView(withMessage message: String) {
        messageLabel.text = message
    }
}

