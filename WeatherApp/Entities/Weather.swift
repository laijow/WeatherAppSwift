//
//  Weather.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation
import RealmSwift

class City: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var latitude: Double = 0.0
}

class Temperature: Object {
    @objc dynamic var currentTemp: Double = 0.0
    @objc dynamic var minTemp: Double = 0.0
    @objc dynamic var maxTemp: Double = 0.0
}

class Weather: Object {
    @objc dynamic var city: City?
    @objc dynamic var temperature: Temperature?
    @objc dynamic var weatherDescription: String = ""
    @objc dynamic var icon: String = ""
    @objc dynamic var humidity: Int = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var windSpeed: Double = 0.0
    @objc dynamic var date: Int64 = 0
    @objc dynamic var isLast: Bool = false
}
