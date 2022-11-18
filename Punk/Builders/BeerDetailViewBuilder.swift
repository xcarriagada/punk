//
//  BeerDetailViewBuilder.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import Foundation

class BeerDetailViewBuilder {
    
    private var view: BeerDetailView
    
    init() {
        view = BeerDetailView()
    }
    
    func add(name: String) -> Self {
        view.nameLabel.text = name
        return self
    }
    
    func add(tagline: String) -> Self {
        view.taglineLabel.text = tagline
        return self
    }
    
    func add(imageURL: URL) -> Self {
        view.imageView.downloaded(fromURL: imageURL)
        return self
    }
    
    func add(description: String) -> Self {
        view.descriptionLabel.text = description
        return self
    }
    
    func add(alcohol: String) -> Self {
        view.alcoholLabel.text = alcohol
        return self
    }
    
    func add(ibu: String) -> Self {
        view.ibuLabel.text = ibu
        return self
    }
    
    func add(ebc: String) -> Self {
        view.ebcLabel.text = ebc
        return self
    }
    
    func build() -> BeerDetailView {
        return view
    }
}
