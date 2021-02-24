//
//  AppSettings.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation

public enum AppSettings {

    public enum key: String {
        case temperatureType
    }

    public static subscript(_ key: key) -> Any? {
        get {
            return UserDefaults.standard.value(forKey: key.rawValue)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key.rawValue)
        }
    }
}

extension AppSettings {
    public static func stringValue(_ key: key) -> String? {
        if let value = AppSettings[key] as? String {
            return value
        }
        return nil
    }
}
