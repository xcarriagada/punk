//
//  BeerDetailView.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation
import UIKit

class BeerDetailView: UIView {
    
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .beige
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var alcoholLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var ibuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var ebcLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(taglineLabel)
        contentView.addSubview(descriptionContentView)
        descriptionContentView.addSubview(imageView)
        descriptionContentView.addSubview(descriptionLabel)
        descriptionContentView.addSubview(alcoholLabel)
        descriptionContentView.addSubview(ibuLabel)
        descriptionContentView.addSubview(ebcLabel)
    }
    
    private func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupNameLabelConstraints()
        setupTaglineLabelConstraints()
        setupDescriptionContentViewConstraints()
        setupImageViewConstraints()
        setupDescriptionLabelConstraints()
        setupAlcoholLabelConstraints()
        setupIBULabelConstraints()
        setupEBCLabelConstraints()
    }
    
    private func setupScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    private func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupTaglineLabelConstraints() {
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taglineLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            taglineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taglineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDescriptionContentViewConstraints() {
        descriptionContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionContentView.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 200),
            descriptionContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: descriptionContentView.topAnchor, constant: -120),
            imageView.centerXAnchor.constraint(equalTo: descriptionContentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupAlcoholLabelConstraints() {
        alcoholLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alcoholLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            alcoholLabel.leadingAnchor.constraint(equalTo: descriptionContentView.leadingAnchor, constant: 20),
            alcoholLabel.trailingAnchor.constraint(equalTo: descriptionContentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupIBULabelConstraints() {
        ibuLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ibuLabel.topAnchor.constraint(equalTo: alcoholLabel.bottomAnchor, constant: 8),
            ibuLabel.leadingAnchor.constraint(equalTo: descriptionContentView.leadingAnchor, constant: 20),
            ibuLabel.trailingAnchor.constraint(equalTo: descriptionContentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupEBCLabelConstraints() {
        ebcLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ebcLabel.topAnchor.constraint(equalTo: ibuLabel.bottomAnchor, constant: 8),
            ebcLabel.leadingAnchor.constraint(equalTo: descriptionContentView.leadingAnchor, constant: 20),
            ebcLabel.trailingAnchor.constraint(equalTo: descriptionContentView.trailingAnchor, constant: -20),
            ebcLabel.bottomAnchor.constraint(equalTo: descriptionContentView.bottomAnchor, constant: -20)
        ])
    }
}
