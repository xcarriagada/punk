//
//  GetBeersService.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation

class BeerFinderService: RestClientService {
    typealias T = [Beer]
    
    var urlString: String = Endpoints.basePath + Endpoints.beerFinder
}
