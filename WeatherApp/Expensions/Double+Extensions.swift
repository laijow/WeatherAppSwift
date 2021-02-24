//
//  Double+Extensions.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 24.02.2021.
//

import Foundation

extension Double {
    
    func temperatureString() -> String {
        guard let type = AppSettings[.temperatureType] as? String else { return "" }
        
        let fahrenheitDouble = (self * 9.0 / 5.0) + 32
        var tempString: String = ""
        switch type {
        case TemperatureType.celsius.rawValue: tempString = String(format: "%.2f ºC", self)
        case TemperatureType.fahrenheit.rawValue: tempString = String(format: "%.2f ºF", fahrenheitDouble)
        default: fatalError("")
        }
        
        return tempString
    }
}
