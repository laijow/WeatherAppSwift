//
//  MapInteractor.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol MapInteractor {
    
}

class DefaultMapInteractor: MapInteractor {
    
    weak var presenter: MapPresenter!
    
    required init(presenter: MapPresenter) {
        self.presenter = presenter
    }
}
