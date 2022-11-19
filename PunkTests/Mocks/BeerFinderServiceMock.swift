//
//  BeerFinderServiceMock.swift
//  PunkTests
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation

@testable import Punk

class BeerFinderServiceMock: BeerFinderService {
    
    var status: StatusType
    
    init(withStatus status: StatusType) {
        self.status = status
    }
    
    override func searchBeer(withParams params: [String : String]?, onSuccess: @escaping ([Beer]) -> Void, onError: @escaping () -> Void) {
        switch status {
        case .success:
            guard let model = Mocks<[Beer]>.create(forResource: "beers") else {
                onError()
                return
            }
            onSuccess(model)
        case .error:
            onError()
        }
    }
    
    override func searchBeer(forId id: String, withParams params: [String : String]?, onSuccess: @escaping ([Beer]) -> Void, onError: @escaping () -> Void) {
        switch status {
        case .success:
            guard let model = Mocks<[Beer]>.create(forResource: "beer_with_id_3") else {
                onError()
                return
            }
            onSuccess(model)
        case .error:
            onError()
        }
    }
}
