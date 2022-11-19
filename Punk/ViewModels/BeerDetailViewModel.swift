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
    
    var imageURL: URL? {
        return URL(string: beer?.image ?? "")
    }
    
    var name: String {
        return beer?.name ?? ""
    }
    
    var description: String {
        return beer?.description ?? ""
    }
    
    var tagline: String {
        return beer?.tagline ?? ""
    }
    
    var abv: String {
        return "ABV: \(beer?.abv ?? 0.0)"
    }
    
    var ibu: String {
        return "IBU: \(beer?.ibu ?? 0.0)"
    }
    
    var ebc: String {
        return "EBC: \(beer?.ebc ?? 0.0)"
    }
    
    var ingredients: [BrewSheet] {
        var array: [BrewSheet] = []
        if let malt = beer?.ingredients?.malt, malt.count>0, let detail = gather(ingredients: malt), !detail.isEmpty {
            array.append(BrewSheet(name: "Malt", detail: detail))
        }
        if let hops = beer?.ingredients?.hops, hops.count>0, let detail = gather(ingredients: hops), !detail.isEmpty {
            array.append(BrewSheet(name: "Hops", detail: detail))
        }
        if let yeast = beer?.ingredients?.yeast, !yeast.isEmpty {
            array.append(BrewSheet(name: "Yeast", detail: yeast))
        }
        return array
    }
    
    var foods: [String] {
        return beer?.foodPairing ?? []
    }
    
    var tips: String {
        return beer?.tips ?? "Not available"
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
    
    private func gather(ingredients: [Ingredient]) -> String? {
        guard ingredients.count > 0 else { return nil }
        if ingredients.count == 1 {
            return ingredients.first?.name
        } else {
            var text: String = ""
            ingredients.forEach({ ingredient in
                if let name = ingredient.name, ingredients.last?.name == name {
                    text += name
                } else if let name = ingredient.name {
                    text += "\(name),"
                }
            })
            return text
        }
    }
}
