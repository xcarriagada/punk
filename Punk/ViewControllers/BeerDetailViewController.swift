//
//  BeerDetailViewController.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    var viewModel: BeerDetailViewModel
    
    lazy var loadingView: LoadingView = LoadingView()
    lazy var errorView: ErrorView = ErrorView()
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
        
        viewModel.showError = { [weak self] in
            guard let self = self else { return }
            self.loadingView.stopLoading()
            self.showErrorView()
        }
        
        viewModel.fetchDataIsFinished = { [weak self] in
            guard let self = self else { return }
            self.loadingView.stopLoading()
            self.showBeerDetailView()
        }
        
        viewModel.fetchData()
        
        setup()
        setupConstraints()
        
        updateLoadingView()
    }
    
    private func updateLoadingView() {
        loadingView.update(withMessage: "Loading...")
        loadingView.startLoading()
    }
    
    private func showErrorView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.removeAllSubviews()
            self.view.addSubview(self.errorView)
            self.setupErrorViewConstraints()
            
            self.errorView.startAnimation()
        }
    }
    
    private func showBeerDetailView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.removeAllSubviews()
            self.view.addSubview(self.beerDetailView)
            self.setupBeerDetailViewConstraints()
            self.beerDetailView.update(withImageURL: self.viewModel.imageURL,
                                       withName: self.viewModel.name,
                                       withDescription: self.viewModel.description,
                                       withTagline: self.viewModel.tagline,
                                       withABV: self.viewModel.abv,
                                       withIBU: self.viewModel.ibu,
                                       withEBC: self.viewModel.ebc,
                                       withBrewSheet: self.viewModel.ingredients,
                                       withFoods: self.viewModel.foods,
                                       andTips: self.viewModel.tips)
        }
    }
}

extension BeerDetailViewController: ViewSetupable {
    
    func setup() {
        view.backgroundColor = .white
        title = "Punk"
        
        view.addSubview(loadingView)
    }
    
    func setupConstraints() {
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
    
    private func setupErrorViewConstraints() {
        errorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            errorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
}
