//
//  BeerDetailViewController.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    lazy var loadingView: LoadingView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
        loadingView.updateView(withMessage: "Loading...")
        loadingView.startLoading()
    }
    
    private func setupView() {
        view.applyGradient(isVertical: true, colorArray: [UIColor.lightGreen, UIColor.lightYellow])
        
        view.addSubview(loadingView)
    }
    
    private func setupConstraints() {
        setupLoadingViewConstraints()
    }
    
    private func setupLoadingViewConstraints() {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
