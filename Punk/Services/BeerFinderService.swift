//
//  GetBeersService.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation

class BeerFinderService: RestClientService<[Beer]> {
    
    func searchBeer(withParams params: [String: String]?, onSuccess: @escaping ([Beer]) -> Void, onError: @escaping () -> Void) {
        urlString = Endpoints.basePath + Endpoints.beerFinder
        super.get(withParams: params, onSuccess: onSuccess, onError: onError)
    }
    
    func searchBeer(forId id: String, withParams params: [String: String]?, onSuccess: @escaping ([Beer]) -> Void, onError: @escaping () -> Void) {
        urlString = Endpoints.basePath + Endpoints.beerFinder + "/\(id)"
        super.get(withParams: params, onSuccess: onSuccess, onError: onError)
    }
}
