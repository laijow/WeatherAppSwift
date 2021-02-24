//
//  DetailWeatherViewModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation

class DetailWeatherViewModel {
    
    private let weather: Weather
    private let localService: LocalService
    
    let cityName: String
    let description: String
    let temperature: String
    let iconURLString: String
    let minAndMaxTemp: String
    
    init(weather: Weather, localService: LocalService) {
        self.weather = weather
        self.localService = localService
        self.cityName = weather.city!.name
        self.description = weather.weatherDescription
        self.temperature = weather.temperature!.currentTemp.temperatureString()
        self.iconURLString = String(format: "%@%@@2x.png", OpenWeatherAPI.imgURLString, weather.icon)
        self.minAndMaxTemp = String(format: "Min:%@ - Max:%@",
                                    weather.temperature!.minTemp.temperatureString(),
                                    weather.temperature!.maxTemp.temperatureString())
    }
    
    func cellForRowAt(index: Int) -> (title: String, description: String) {
        var title = ""
        var description = ""
        switch index {
        case 0:
            title = "Humidity"
            description = "\(weather.humidity)%"
        case 1:
            title = "Pressure"
            description = "\(weather.pressure) mm Hg"
        case 2:
            title = "Wind speed"
            description = "\(weather.windSpeed) m/s"
        default: fatalError("Unsupported index")
        }
        
        return (title: title, description: description)
    }
    
    func saveData() {
        localService.save(object: weather)
    }
}
