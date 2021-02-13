//
//  WeatherComponent.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

final class WeatherComponent: WeatherUIComponent {
    func makeMapViewController() -> MapViewController {
        return MapViewController()
    }
    
    func makePlacesListViewController() -> PlacesListViewController {
        return PlacesListViewController()
    }
}
