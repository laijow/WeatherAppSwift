//
//  PlacesListViewModel.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

struct PlacesListViewModel {
    struct Cell: PlacesListCellViewModel {
        
    }
    
    private let cells: [Cell]?
    
    init(cells: [Cell]?) {
        self.cells = cells
    }
    
    func numberOfItems() -> Int {
        return cells?.count ?? 0
    }
}
