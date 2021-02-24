//
//  MapRouter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

protocol MapRouter: RootRouter {
    
}

class DefaultMapRouter: MapRouter {
    
    var viewController: UIViewController?
    internal let component: WeatherUIComponent
    
    init(viewController: MapViewController,
         component: WeatherUIComponent) {
        self.viewController = viewController
        self.component = component
    }
}
