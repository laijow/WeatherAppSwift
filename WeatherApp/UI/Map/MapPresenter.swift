//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol MapPresenter: class {
    var router: MapRouter! { get set }
    func showDetail()
    func getWeather(with lon: Double, lat: Double)
    func updateWeatherData(_ weather: WeatherDTO)
    func saveLastWeather()
    func getLastWeather() -> Weather?
    func updateInfo()
}

class DefaultMapPresenter: MapPresenter {
        
    weak var view: MapView!
    private let mapper: WeatherMapper
    private var weather: Weather?
    
    var router: MapRouter!
    var interactor: MapInteractor!
    
    required init (view: MapView, mapper: WeatherMapper) {
        self.view = view
        self.mapper = mapper
    }
    
    func showDetail() {
        guard let weather = weather else { return }
        router.showDetail(weather)
    }
    
    func getWeather(with lon: Double, lat: Double) {
        interactor.fetchWeather(with: lon, lat: lat)
    }
    
    func updateWeatherData(_ weather: WeatherDTO) {
        let weather = mapper.map(input: weather)
        self.weather = weather
        
        updateInfo()
    }
    
    func getLastWeather() -> Weather? {
        let weather = interactor.getLastWeather()
        if let date = weather?.date {
            let currentDate = Date()
            let date = Date.init(timeIntervalSince1970: TimeInterval(date))
            
            if currentDate.uniqueDate() == date.uniqueDate() {
                self.weather = weather
                updateInfo()
            }
        }
        return interactor.getLastWeather()
    }
    
    func saveLastWeather() {
        guard let weather = weather else { return }
        interactor.saveLastWeather(weather)
    }
    
    func updateInfo() {
        guard let weather = weather,
              let name = weather.city?.name,
              let temp = weather.temperature?.currentTemp else { return }
        let viewModel = MapViewModel(cityName: name,
                                     temperature: temp)
        DispatchQueue.main.async { [weak self] in
            self?.view.updateInfo(with: viewModel)
        }
    }
}
