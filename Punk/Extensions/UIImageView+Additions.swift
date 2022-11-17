//
//  UIImageView+Additions.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    func downloaded(fromURL url: URL) {
        AF.request(url.absoluteString).responseImage { [weak self] response in
            guard let self = self else { return }
            if case .success(let image) = response.result {
                self.image = image
            }
        }
    }
}

