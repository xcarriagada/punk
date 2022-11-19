//
//  UILabel+Additions.swift
//  Punk
//
//  Created by Ximena Arriagada on 19/11/2022.
//

import Foundation
import UIKit

enum Style {
    case h1
    case h2
    case h3
    case h4
    case body
}

extension Style {
    
    var textColor: UIColor {
        switch self {
        case .h1:
            return .darkGray
        case .h2, .h3, .h4:
            return .lightGray
        case .body:
            return .extraLightGray
        }
    }
    
    var font: UIFont {
        switch self {
        case .h1:
            return UIFont.boldSystemFont(ofSize: 28)
        case .h2:
            return UIFont.boldSystemFont(ofSize: 20)
        case .h3:
            return UIFont.boldSystemFont(ofSize: 14)
        case .h4:
            return UIFont.italicSystemFont(ofSize: 14)
        case .body:
            return UIFont.systemFont(ofSize: 14)
        }
    }
}

extension UILabel {
    
    func apply(text: String, withStyle style: Style) {
        self.text = text
        self.textColor = style.textColor
        self.font = style.font
    }
}
