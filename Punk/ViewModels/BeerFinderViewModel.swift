//
//  BeerFinderViewModel.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation

class BeerFinderViewModel {
    
    var service: BeerFinderService
    
    var beers: [Beer]? {
        didSet {
            if let _beers = beers, _beers.count > 0 {
                fetchDataIsFinished?()
            } else {
                noResultFound?()
            }
        }
    }
    
    var fetchDataIsFinished: (() -> Void)?
    var noResultFound: (() -> Void)?
    var showError: (() -> Void)?
    
    init(withService service: BeerFinderService = BeerFinderService()) {
        self.service = service
    }
    
    func searchBeerFor(food: String) {
        service.get(withParams: ["food": food.replacingOccurrences(of: " ", with: "_")],
                    onSuccess: { [weak self] model in
            guard let self = self else { return }
            self.beers = model
        }, onError: { [weak self] in
            guard let self = self else { return }
            self.showError?()
        })
    }
    
    func getIdForBeer(withIndex index: Int) -> Int? {
        return beers?[index].id
    }
    
    func getImagePathForBeer(withIndex index: Int) -> String {
        return beers?[index].image ?? ""
    }
    
    func getNameForBeer(withIndex index: Int) -> String? {
        return beers?[index].name
    }
    
    func getTaglineForBeer(withIndex index: Int) -> String? {
        return beers?[index].tagline
    }
}
