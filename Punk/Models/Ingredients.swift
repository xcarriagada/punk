//
//  Ingredients.swift
//  Punk
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation

struct Ingredients: Decodable {
    let malt: [Ingredient]?
    let hops: [Ingredient]?
    let yeast: String?
}
