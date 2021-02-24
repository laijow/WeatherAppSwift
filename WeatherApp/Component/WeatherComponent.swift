//
//  WeatherComponent.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

final class WeatherComponent: WeatherUIComponent {
    func makeMapViewController() -> MapViewController {
        return MapViewController()
    }
    
    func makePlacesListViewController() -> PlacesListViewController {
        return PlacesListViewController()
    }
    
    func makeDetailWeatherViewController(_ weather: Weather) -> DetailWeatherViewController {
        let storyboard = UIStoryboard(name: "DetailWeather",
                                      bundle: nil)
        let localService = DefaultLocalService()
        guard let detailVC = storyboard.instantiateViewController(identifier: "DetailWeather")
                as? DetailWeatherViewController else { fatalError("") }
        detailVC.viewModel = DetailWeatherViewModel(weather: weather,
                                                    localService: localService)
        detailVC.modalPresentationStyle = .overFullScreen
        
        return detailVC
    }
}
