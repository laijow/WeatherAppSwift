//
//  MapRouter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol MapRouter {
    
}

class DefaultMapRouter: MapRouter {
    
    weak var viewController: MapViewController!
    
    init(viewController: MapViewController) {
        self.viewController = viewController
    }
}
