//
//  PlacesListPresenter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol PlacesListPresenter: class {
    var router: PlacesListRouter! { set get }
}

class DefaultPlacesListPresenter: PlacesListPresenter {
    
    weak var view: PlacesListView!
    var router: PlacesListRouter!
    var interactor: PlacesListInteractor!
    
    required init (view: PlacesListView) {
        self.view = view
    }
}
