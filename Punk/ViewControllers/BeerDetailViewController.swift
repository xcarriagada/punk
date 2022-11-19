//
//  BeerDetailViewController.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    var viewModel: BeerDetailViewModel
    
    lazy var beerDetailView: BeerDetailView = BeerDetailView()

    init(withViewModel viewModel: BeerDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchDataIsFinished = { [weak self] in
            guard let self = self else { return }
            self.showBeerDetailView()
        }
        
        viewModel.showError = { [weak self] in
            guard let self = self else { return }
            self.showErrorView()
        }
        
        viewModel.fetchData()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func setupConstraints() {
        
    }
    
    private func setupBeerDetailViewConstraints() {
        beerDetailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            beerDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            beerDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            beerDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beerDetailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func showBeerDetailView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.removeAllSubviews()
            self.view.addSubview(self.beerDetailView)
            self.setupBeerDetailViewConstraints()
            self.beerDetailView.updateView(withName: self.viewModel.name,
                                           withTagline: self.viewModel.tagline,
                                           withImagePath: self.viewModel.imagePath ?? "",
                                           withDescription: self.viewModel.description)
        }
    }
    
    private func showErrorView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.removeAllSubviews()
            
        }
    }
}
