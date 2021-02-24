//
//  MapViewModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

struct MapViewModel {
    let cityName: String
    let temperature: String
    
    init(cityName: String, temperature: Double) {
        self.cityName = cityName
        self.temperature = temperature.temperatureString()
    }
}
