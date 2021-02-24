//
//  RootRouter.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 24.02.2021.
//

import UIKit

protocol RootRouter {
    var viewController: UIViewController? { get }
    var component: WeatherUIComponent { get }
    
    func showDetail(_ weather: Weather)
}

extension RootRouter {
    
    func showDetail(_ weather: Weather) {
        let detailVC = component.makeDetailWeatherViewController(weather)
        
        viewController?.show(detailVC, sender: nil)
    }
}
