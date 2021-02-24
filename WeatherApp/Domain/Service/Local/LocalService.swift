//
//  LocalService.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation
import RealmSwift

protocol LocalService {
    func save<T: Object>(object: T)
    func deleate<T: Object>(object: T)
    func load<T>(object: T) -> Results<Object>
}

protocol WeatherLocalService: LocalService {
    func updateLast(with newWeather: Weather)
}
