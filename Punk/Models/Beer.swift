//
//  Beer.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation

struct Beer: Decodable {
    let name: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "image_url"
    }
}
