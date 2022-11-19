//
//  UINavigationBar+Additions.swift
//  Punk
//
//  Created by Ximena Arriagada on 18/11/2022.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    func applyStyle() {
        barStyle = .black
        tintColor = .white
        isTranslucent = true
        titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
