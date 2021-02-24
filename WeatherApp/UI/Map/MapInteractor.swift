//
//  MapInteractor.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation
import RxSwift

protocol MapInteractor {
    func fetchWeather(with lon: Double, lat: Double)
    func saveLastWeather(_ weather: Weather)
    func getLastWeather() -> Weather?
}

class DefaultMapInteractor: MapInteractor {
        
    weak var presenter: MapPresenter!
    
    private let localService: WeatherLocalService
    private let fetcher: WeatherDataFetcher
    private let disposbag = DisposeBag()
    
    required init(presenter: MapPresenter,
                  fetcher: WeatherDataFetcher, localService: WeatherLocalService) {
        self.presenter = presenter
        self.fetcher = fetcher
        self.localService = localService
    }
    
    func fetchWeather(with lon: Double, lat: Double) {
        fetcher.fetchWeather(with: lon, lat: lat).take(1).subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let weather):
                self?.fetchDidFinish(weather)
            case .failure(let error):
            print(error.localizedDescription)
            }
            
        }).disposed(by: disposbag)
    }
    
    func saveLastWeather(_ weather: Weather) {
        let lastWeather = Weather()
        
        lastWeather.city = weather.city
        lastWeather.temperature = weather.temperature
        lastWeather.humidity = weather.humidity
        lastWeather.pressure = weather.pressure
        lastWeather.icon = weather.icon
        lastWeather.weatherDescription = weather.weatherDescription
        lastWeather.windSpeed = weather.windSpeed
        lastWeather.date = weather.date
        lastWeather.isLast = true
        
        localService.updateLast(with: lastWeather)
    }
    
    func getLastWeather() -> Weather? {
        let weathers = localService.load(object: Weather.self).filter("isLast = true")
        
        guard let weather = weathers.last as? Weather else { return nil }
        return weather
    }
    
    private func fetchDidFinish(_ weather: WeatherDTO) {
        presenter.updateWeatherData(weather)
    }
}
