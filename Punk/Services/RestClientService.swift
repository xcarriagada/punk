//
//  RestClientService.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation
import Alamofire

class RestClientService<Element: Decodable> {
    
    var urlString: String = ""
    
    func get(withParams params: [String: String]?, onSuccess: @escaping (Element) -> Void, onError: @escaping () -> Void) {
        AF.request(add(params: params, toURLString: urlString))
            .validate()
            .responseDecodable(of: Element.self) { response in
                switch response.result {
                case .success(let model):
                    onSuccess(model)
                case .failure(_ ):
                    onError()
                }
            }
    }
    
    private func add(params: [String: String]?, toURLString urlString: String) -> String {
        var _params = ""
        var newURLString: String = urlString
        guard let params = params else { return newURLString }
        
        params.forEach({ (key: String, value: String) in
            _params += "&\(key)=\(value)"
        })

        if !_params.isEmpty {
            _params.removeFirst()
            newURLString += "?\(_params)"
        }
        
        return newURLString
    }
}
