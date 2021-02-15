//
//  DataFetcherService.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import Foundation
import RxSwift

class DataFetcherService {
    
    private let networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    private func buildGETMethodURL(components: [String: String], defaultStringURL: String) -> URL {
        var component = URLComponents(string: defaultStringURL)!
        
        component.queryItems = components.map { return URLQueryItem(name: $0, value: $1) }
        return component.url!
    }
}

extension DataFetcherService: WeatherDataFetcher {
    func fetchWeather(with lon: Double, lat: Double) -> Observable<WeatherResult> {
        let components = [
            "lon": "\(lon)",
            "lat": "\(lat)",
            "appid": OpenWeatherAPI.apiKey
        ]
        
        let url = buildGETMethodURL(components: components,
                                    defaultStringURL: OpenWeatherAPI.apiURLString)
        return networkDataFetcher.fetchGenericJSONData(url: url,
                                                       type: WeatherModel.self,
                                                       method: .GET,
                                                       parameters: nil)
    }
}


