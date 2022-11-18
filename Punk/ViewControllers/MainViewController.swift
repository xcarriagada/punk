//
//  MainViewController.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.isTranslucent = true
        searchBar.tintColor = .lightYellow
        searchBar.backgroundColor = .clear
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.applyGradient(isVertical: true, colorArray: [UIColor.lightGreen, UIColor.lightYellow])
        
        view.addSubview(searchBar)
    }
    
    private func setupConstraints() {
        setupSearchBarConstraints()
    }
    
    private func setupSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
