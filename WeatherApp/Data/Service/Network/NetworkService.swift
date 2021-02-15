//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

class NetworkService: Networking {
    
    func request(url: URL, method: NetworkMethod, parameters: [String: String]?) -> Observable<Data> {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.cachePolicy = .reloadIgnoringCacheData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        switch method {
        case .GET: print("GET Method")
        case .POST:
            request.httpBody = createParametersData(parameters!)
        case .DELETE: print("DELETE Method")
        }
        
        return URLSession.shared.rx.response(request: request)
            .asObservable()
            .map { response -> Data in
                return response.data
            }
    }
    
    private func createParametersData(_ parameters: [String: String]) -> Data? {
        var parametersString = ""
        
        let keys = parameters.keys
        for key in keys {
            let parameterString = "\(key)=\(parameters[key]!)"
            parametersString += key == keys.first ? parameterString : "&" + parameterString
        }
        
        return parametersString.data(using: .utf8)
    }
}
