//
//  Mapper.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation

protocol Mapper {
    associatedtype Input
    associatedtype Output
    
    func map(input: Input) -> Output
}
