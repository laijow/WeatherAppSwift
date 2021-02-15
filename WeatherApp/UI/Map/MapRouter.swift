//
//  MapRouter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol MapRouter {
    func showDetail()
}

class DefaultMapRouter: MapRouter {
        
    weak var viewController: MapViewController!
    
    init(viewController: MapViewController) {
        self.viewController = viewController
    }
    
    func showDetail() {
        print("Show detail on router")
    }
}
