//
//  BeerDetailViewModel.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation

class BeerDetailViewModel {
    
    var beerId: Int
    var service: BeerFinderService
    
    var beer: Beer? {
        didSet {
            fetchDataIsFinished?()
        }
    }
    
    var name: String {
        return beer?.name ?? ""
    }
    
    var tagline: String {
        return beer?.tagline ?? ""
    }
    
    var description: String {
        return beer?.description ?? ""
    }
    
    var imagePath: String? {
        return beer?.image
    }
    
    var ibu: String {
        return "IBU: \(beer?.ibu ?? 0.0)"
    }
    
    var ebc: String {
        return "EBC: \(beer?.ebc ?? 0.0)"
    }
    
    var fetchDataIsFinished: (() -> Void)?
    var showError: (() -> Void)?
    
    init(withBeerId beerId: Int, service: BeerFinderService = BeerFinderService()) {
        self.beerId = beerId
        self.service = service
    }
    
    func fetchData() {
        service.urlString += "/\(beerId)"
        service.get(withParams: nil,
                    onSuccess: { [weak self] model in
            guard let self = self else { return }
            self.beer = model.first
        }, onError: { [weak self] in
            guard let self = self else { return }
            self.showError?()
        })
    }
}
