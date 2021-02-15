//
//  Networking.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import Foundation
import RxSwift

enum NetworkMethod: String {
    case GET = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
}

protocol Networking {
    func request(url: URL, method: NetworkMethod,
                 parameters: [String: String]?) -> Observable<Data>
}
