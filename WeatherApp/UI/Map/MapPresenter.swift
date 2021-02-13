//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol MapPresenter: class {
    var router: MapRouter! { get set }
}

class DefaultMapPresenter: MapPresenter {
    
    weak var view: MapView!
    var router: MapRouter!
    var interactor: MapInteractor!
    
    required init (view: MapView) {
        self.view = view
    }
}
