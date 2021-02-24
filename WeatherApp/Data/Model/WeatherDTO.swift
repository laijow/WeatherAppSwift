//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import Foundation

typealias WeatherResult = Result<WeatherDTO, Error>

struct WeatherDTO: Decodable {
    let id: Int
    let weather: [Info]
    let name: String
    let dt: Int64
    let main: Main
    let coord: Coordinate
    let wind: Wind
}

struct Main: Decodable {
    private enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
        case pressure
    }
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    let pressure: Int
}

struct Coordinate: Decodable {
    let lat: Double
    let lon: Double
}

struct Info: Decodable {
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}

class WeatherMapper: Mapper {
        
    typealias Input = WeatherDTO
    typealias Output = Weather
    
    func map(input: WeatherDTO) -> Weather {
        let weather = Weather()
        let city = City()
        city.name = input.name
        city.longitude = input.coord.lon
        city.latitude =  input.coord.lat
        
        let temperature = Temperature()
        temperature.currentTemp = input.main.temp
        temperature.minTemp = input.main.tempMin
        temperature.maxTemp = input.main.tempMax
        
        var description = ""
        var icon = ""
        
        if let info = input.weather.first {
            description = info.description
            icon = info.icon
        }
        
        weather.city = city
        weather.temperature = temperature
        weather.weatherDescription = description
        weather.icon = icon
        weather.humidity = input.main.humidity
        weather.pressure = input.main.pressure
        weather.windSpeed = input.wind.speed
        weather.date = input.dt
        
        return weather
    }
}
