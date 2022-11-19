//
//  BeerFinderViewController.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import UIKit

class BeerFinderViewController: UIViewController {
    
    var viewModel: BeerFinderViewModel
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Try `chicken`"
        return searchBar
    }()
    
    lazy var tableView: UITableView = UITableView()
    
    init(withViewModel viewModel: BeerFinderViewModel) {
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
            self.tableView.reloadData()
        }
        
        viewModel.noResultFound = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        viewModel.showError = { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
        setup()
        setupConstraints()
    }
}

extension BeerFinderViewController: ViewSetupable {
    
    func setup() {
        view.backgroundColor = .white
        title = "Punk"
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupConstraints() {
        setupSearchBarConstraints()
        setupTableViewConstraints()
    }
    
    private func setupSearchBarConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension BeerFinderViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            viewModel.clean()
            return
        }
        viewModel.searchBeerFor(food: searchText)
    }
}

extension BeerFinderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        
        if let name = viewModel.getNameForBeer(withIndex: indexPath.row), !name.isEmpty {
            cell.textLabel?.text = name
        }
        
        if let tagline = viewModel.getTaglineForBeer(withIndex: indexPath.row), !tagline.isEmpty {
            cell.detailTextLabel?.text = tagline
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = viewModel.getIdForBeer(withIndex: indexPath.row) else { return }
        navigationController?.pushViewController(BeerDetailViewController(withViewModel: BeerDetailViewModel(withBeerId: id)), animated: true)
    }
}



