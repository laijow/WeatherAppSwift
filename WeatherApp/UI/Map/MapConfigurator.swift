//
//  MapConfigurator.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol MapConfigurator {
   func configure(with viewController: MapViewController)
}

class DefaultMapConfigurator: MapConfigurator {
    
    func configure(with viewController: MapViewController) {
        let presenter = DefaultMapPresenter(view: viewController)
        let interactor = DefaultMapInteractor(presenter: presenter)
        let router = DefaultMapRouter(viewController: viewController)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
