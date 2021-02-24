//
//  WeatherUIComponent.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol WeatherUIComponent {
    func makeMapViewController() -> MapViewController
    func makePlacesListViewController() -> PlacesListViewController
    func makeDetailWeatherViewController(_ weather: Weather) -> DetailWeatherViewController
}
