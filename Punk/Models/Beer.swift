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
    let abv: Double?
    let ibu: Double?
    let ebc: Double?
    let ingredients: Ingredients?
    let foodPairing: [String]?
    let tips: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case image = "image_url"
        case abv
        case ibu
        case ebc
        case ingredients
        case foodPairing = "food_pairing"
        case tips = "brewers_tips"
    }
}
