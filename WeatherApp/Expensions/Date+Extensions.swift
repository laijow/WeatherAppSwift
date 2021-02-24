//
//  Date+Extensions.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 24.02.2021.
//

import Foundation

extension Date {
    
    func uniqueDate() -> String {
        let components = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return "\(components.year)\(components.month)\(components.day)"
    }
}
