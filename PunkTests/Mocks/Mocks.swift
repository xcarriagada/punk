//
//  Mocks.swift
//  PunkTests
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation

class Mocks<Element: Decodable> {
    
    static func create(forResource resource: String) -> Element? {
        guard let path = Bundle(for: Mocks.self).path(forResource: resource, ofType: ".json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let decoder = JSONDecoder()
            return try decoder.decode(Element.self, from: data)
        } catch {
            return nil
        }
    }
}
