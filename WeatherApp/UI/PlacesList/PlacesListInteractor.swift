//
//  PlacesListInteractor.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol PlacesListInteractor: class {
    
}

class DefaultPlacesListInteractor: PlacesListInteractor {
    
    weak var presenter: PlacesListPresenter!

    required init(presenter: PlacesListPresenter) {
        self.presenter = presenter
    }
}
