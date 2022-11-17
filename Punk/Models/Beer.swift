//
//  Beer.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name: String?
    let tagline: String?
    let description: String?
    let image: String?
    let ibu: Double?
    let ebc: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case image = "image_url"
        case ibu
        case ebc
    }
}
