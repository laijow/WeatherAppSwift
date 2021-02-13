//
//  PlacesListRouter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol PlacesListRouter {
    
}

class DefaultPlacesListRouter: PlacesListRouter {
    
    weak var viewController: PlacesListViewController!
        
    init(viewController: PlacesListViewController) {
        self.viewController = viewController
    }
}
