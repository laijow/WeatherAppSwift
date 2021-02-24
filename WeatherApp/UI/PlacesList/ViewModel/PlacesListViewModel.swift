//
//  PlacesListViewModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

struct PlacesListViewModel {
    struct Cell: PlacesListCellViewModel {
        var cityName: String
        var temperature: String
        
        init(cityName: String, temperature: Double) {
            self.cityName = cityName
            self.temperature = temperature.temperatureString()
        }
    }
    
    private let cells: [Cell]
    
    init(cells: [Cell]) {
        self.cells = cells
    }
    
    func numberOfItems() -> Int {
        return cells.count
    }
    
    func cellViewModelAt(index: Int) -> PlacesListCellViewModel {
        return cells[index]
    }
}
