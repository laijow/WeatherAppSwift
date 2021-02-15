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
    func updateWeatherData(_ weather: WeatherModel)
}

class DefaultMapPresenter: MapPresenter {
        
    weak var view: MapView!
    var router: MapRouter!
    var interactor: MapInteractor!
    
    required init (view: MapView) {
        self.view = view
    }
    
    func showDetail() {
        print("Show detail on presenter")
        router.showDetail()
    }
    
    func getWeather(with lon: Double, lat: Double) {
        interactor.fetchWeather(with: lon, lat: lat)
    }
    
    func updateWeatherData(_ weather: WeatherModel) {
        DispatchQueue.main.async {
            print(weather)
        }
    }
}
