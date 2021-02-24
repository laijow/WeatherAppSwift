//
//  PlacesListInteractor.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation
import RealmSwift

protocol PlacesListInteractor: class {
    func getLocalWeather() -> Results<Object>?
    func deleteWeather(weather: Weather)
}

class DefaultPlacesListInteractor: PlacesListInteractor {
        
    weak var presenter: PlacesListPresenter!
    private let localService: LocalService

    required init(presenter: PlacesListPresenter, localService: LocalService) {
        self.presenter = presenter
        self.localService = localService
    }
    
    func getLocalWeather() -> Results<Object>? {
        let weathers = localService.load(object: Weather.self).filter("isLast = false")
        
        return weathers
    }
    
    func deleteWeather(weather: Weather) {
        localService.deleate(object: weather)        
    }
}
