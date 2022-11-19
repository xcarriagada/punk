//
//  BeerDetailView.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation
import UIKit

class BeerDetailView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var contentView: UIView = UIView()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var propertiesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.apply(text: "Ingredients", withStyle: .h2)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var ingredientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var foodPairingLabel: UILabel = {
        let label = UILabel()
        label.apply(text: "Food Pairing", withStyle: .h2)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var foodStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var tipsLabel: UILabel = {
        let label = UILabel()
        label.apply(text: "Tips", withStyle: .h2)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var brewersTipsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(withImageURL imageURL: URL?,
                withName name: String,
                withDescription description: String,
                withTagline tagline: String,
                withABV abv: String,
                withIBU ibu: String,
                withEBC ebc: String,
                withBrewSheet brewSheet: [BrewSheet],
                withFoods foods: [String],
                andTips tips: String) {
        if let url = imageURL {
            updateImageView(withURL: url)
        }
        updateNameLabel(withText: name)
        updateDescriptionLabel(withText: description)
        updateTaglineLabel(withText: tagline)
        addPropertyInStackView(withText: abv)
        addPropertyInStackView(withText: ibu)
        addPropertyInStackView(withText: ebc)
        updateIngredientsStackView(withBrewSheet: brewSheet)
        updateFoodStackView(withTexts: foods)
        updateBrewersTipsLabel(withText: tips)
    }
    
    private func updateImageView(withURL url: URL) {
        imageView.downloaded(fromURL: url)
    }
    
    private func updateNameLabel(withText text: String) {
        nameLabel.apply(text: text, withStyle: .h1)
    }
    
    private func updateDescriptionLabel(withText text: String) {
        descriptionLabel.apply(text: text, withStyle: .body)
    }
    
    private func updateTaglineLabel(withText text: String) {
        taglineLabel.apply(text: text, withStyle: .h4)
    }
    
    private func addPropertyInStackView(withText text: String) {
        let label: UILabel = UILabel()
        label.apply(text: text, withStyle: .body)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        propertiesStackView.addArrangedSubview(label)
    }
    
    private func updateIngredientsStackView(withBrewSheet brewSheet: [BrewSheet]) {
        brewSheet.forEach({ item in
            let subtitleView = SubtitleView()
            subtitleView.update(withText: item.name, andDetailText: item.detail)
            ingredientsStackView.addArrangedSubview(subtitleView)
        })
    }
    
    private func updateFoodStackView(withTexts texts: [String]) {
        texts.forEach({ text in
            let label: UILabel = UILabel()
            label.apply(text: text, withStyle: .body)
            label.textAlignment = .left
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            
            foodStackView.addArrangedSubview(label)
        })
    }
    
    private func updateBrewersTipsLabel(withText text: String) {
        brewersTipsLabel.apply(text: text, withStyle: .body)
    }
}

extension BeerDetailView: ViewSetupable {
    
    func setup() {
        addSubview(imageView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(taglineLabel)
        contentView.addSubview(propertiesStackView)
        contentView.addSubview(ingredientsLabel)
        contentView.addSubview(ingredientsStackView)
        contentView.addSubview(foodPairingLabel)
        contentView.addSubview(foodStackView)
        contentView.addSubview(tipsLabel)
        contentView.addSubview(brewersTipsLabel)
    }
    
    func setupConstraints() {
        setupImageViewConstraints()
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
        setupTaglineLabelConstraints()
        setupPropertiesStackViewConstraints()
        setupIngredientsLabelConstraints()
        setupIngredientsStackViewConstraints()
        setupFoodPairingLabelConstraints()
        setupFoodStackViewConstraints()
        setupTipsLabelConstraints()
        setupBrewersTipsLabelLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -100),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-100)
        ])
    }
    
    private func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupTaglineLabelConstraints() {
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taglineLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            taglineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            taglineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupPropertiesStackViewConstraints() {
        propertiesStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            propertiesStackView.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 20),
            propertiesStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            propertiesStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupIngredientsLabelConstraints() {
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: propertiesStackView.bottomAnchor, constant: 20),
            ingredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            ingredientsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupIngredientsStackViewConstraints() {
        ingredientsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientsStackView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 20),
            ingredientsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            ingredientsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupFoodPairingLabelConstraints() {
        foodPairingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodPairingLabel.topAnchor.constraint(equalTo: ingredientsStackView.bottomAnchor, constant: 20),
            foodPairingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            foodPairingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupFoodStackViewConstraints() {
        foodStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodStackView.topAnchor.constraint(equalTo: foodPairingLabel.bottomAnchor, constant: 20),
            foodStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            foodStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupTipsLabelConstraints() {
        tipsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tipsLabel.topAnchor.constraint(equalTo: foodStackView.bottomAnchor, constant: 20),
            tipsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            tipsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupBrewersTipsLabelLabelConstraints() {
        brewersTipsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brewersTipsLabel.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 20),
            brewersTipsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            brewersTipsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            brewersTipsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
