//
//  WeatherDataFetcher.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import Foundation
import RxSwift


protocol WeatherDataFetcher {
    func fetchWeather(with lon: Double, lat: Double) -> Observable<WeatherResult>
}
