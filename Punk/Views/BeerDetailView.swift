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
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .extraLightGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    /*lazy var scrollView: UIScrollView = UIScrollView()
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        return imageView
    }()*/
    
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
        
        addSubview(imageView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(taglineLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        /*addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(taglineLabel)
        contentView.addSubview(imageView)*/
    }
    
    private func setupConstraints() {
        setupImageViewConstraints()
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupTaglineLabelConstraints()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
        /*setupScrollViewConstraints()
        setupContentViewConstraints()
        setupNameLabelConstraints()
        setupTaglineLabelConstraints()
        setupImageViewConstraints()*/
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
    
    private func setupTaglineLabelConstraints() {
        taglineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taglineLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            taglineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            taglineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    /*private func setupScrollViewConstraints() {
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
            taglineLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            taglineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            taglineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupImageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 80),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 550)
        ])
    }*/
    
    func updateView(withName name: String, withTagline tagline: String, withImagePath imagePath: String, withDescription description: String) {
        //nameLabel.text = name
        //taglineLabel.text = tagline
        
        if let url = URL(string: imagePath) {
            imageView.downloaded(fromURL: url)
        }
        
        taglineLabel.text = tagline
        nameLabel.text = name
        descriptionLabel.text = description
    }
}
