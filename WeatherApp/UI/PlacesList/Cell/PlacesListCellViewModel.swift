//
//  PlacesListCellViewModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol PlacesListCellViewModel {
    var cityName: String { get }
    var temperature: String { get }
}
