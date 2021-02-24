//
//  PlacesListPresenter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation
import RealmSwift

protocol PlacesListPresenter: class {
    var router: PlacesListRouter! { set get }
    func showDetail(index: Int)
    func getLocalWeather()
    func deleteWeatherAt(index: Int)
}

class DefaultPlacesListPresenter: PlacesListPresenter {
        
    weak var view: PlacesListView!
    var router: PlacesListRouter!
    var interactor: PlacesListInteractor!
    
    private var weathers: Results<Object>?
    
    required init (view: PlacesListView) {
        self.view = view
    }
    
    func getLocalWeather() {
        weathers = interactor.getLocalWeather()
        let cells = weathers?.reduce([PlacesListViewModel.Cell]()) { (result, weather) -> [PlacesListViewModel.Cell] in
            var result = result
            guard let weather = weather as? Weather else { fatalError("Impossible type") }
            if let cityName = weather.city?.name, let temp = weather.temperature?.currentTemp {
                let cell = PlacesListViewModel.Cell(cityName: cityName,
                                                    temperature: temp)
                result.append(cell)
            }
            
            return result
        }
        guard let pCells = cells else { return }
        view.displayData(viewModel: PlacesListViewModel(cells: pCells))
    }
    
    func deleteWeatherAt(index: Int) {
        if let weather = weathers?[index] as? Weather {
            interactor.deleteWeather(weather: weather)
            getLocalWeather()
        }
    }
    
    func showDetail(index: Int) {
        if let weather = weathers?[index] as? Weather {
            router.showDetail(weather)
        }
    }
}
