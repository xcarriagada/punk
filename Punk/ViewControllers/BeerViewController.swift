//
//  BeerViewController.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import UIKit

class BeerViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var contentView: UIView = UIView()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func setupView() {
    
    }
    
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
}
