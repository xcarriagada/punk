//
//  RestClientService.swift
//  Punk
//
//  Created by Ximena Arriagada on 17/11/2022.
//

import Foundation
import Alamofire

protocol RestClientService {
    associatedtype T: Decodable
    var urlString: String { get set }
    func add(params: [String: String]?, toURLString urlString: String) -> String
    func get(withParams params: [String: String]?, onSuccess: @escaping (T) -> Void, onError: @escaping () -> Void)
}

extension RestClientService {
    func add(params: [String: String]?, toURLString urlString: String) -> String {
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
    
    func get(withParams params: [String: String]?, onSuccess: @escaping (T) -> Void, onError: @escaping () -> Void) {
        AF.request(add(params: params, toURLString: urlString))
            .validate()
            .responseDecodable(of: T.self) { response in
                guard let statusCode = response.response?.statusCode else {
                    onError()
                    return
                }
                if statusCode == 200 {
                    guard let model = response.value else {
                        onError()
                        return
                    }
                    onSuccess(model)
                } else {
                    onError()
                }
            }
    }
}
