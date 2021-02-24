//
//  PlacesListRouter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

protocol PlacesListRouter: RootRouter {
    
}

class DefaultPlacesListRouter: PlacesListRouter {
    
    var viewController: UIViewController?
    var component: WeatherUIComponent
    
    init(viewController: PlacesListViewController,
         component: WeatherUIComponent) {
        self.viewController = viewController
        self.component = component
    }
}
