//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import Foundation

typealias WeatherResult = Result<WeatherModel, Error>

struct WeatherModel: Decodable {
    let list: [WeatherData]
    let city: City
}

struct WeatherData: Decodable {
    let dt: Int64
    let main: Main
}

struct Main: Decodable {
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
}

struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coordinate
}

struct Coordinate: Decodable {
    let lat: Double
    let lon: Double
}
