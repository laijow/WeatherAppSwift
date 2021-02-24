//
//  DefaultLocalService.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation
import RealmSwift

class DefaultLocalService: WeatherLocalService {
    
    let realm = try! Realm()
    
    func save<T: Object>(object: T) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func deleate<T: Object>(object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func load<T>(object: T) -> Results<Object> {
        let objects = realm.objects(object.self as! Object.Type)
        return objects
    }
    
    func updateLast(with newWeather: Weather) {
        let weathers = realm.objects(Weather.self).filter("isLast = true")

        if weathers.isEmpty {
            save(object: newWeather)
            return
        }
        
        guard let weather = weathers.first else { return }
        try! realm.write {
            guard let city = newWeather.city, let temp = newWeather.temperature else  { fatalError("missing data") }
            weather.city?.name = city.name
            weather.city?.latitude = city.latitude
            weather.city?.longitude = city.longitude
            weather.temperature?.currentTemp = temp.currentTemp
            weather.temperature?.minTemp = temp.minTemp
            weather.temperature?.maxTemp = temp.maxTemp
            weather.humidity = newWeather.humidity
            weather.pressure = newWeather.pressure
            weather.icon = newWeather.icon
            weather.weatherDescription = newWeather.weatherDescription
            weather.windSpeed = newWeather.windSpeed
            weather.date = newWeather.date
        }
    }
}
