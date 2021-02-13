//
//  PlacesListConfigurator.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation

protocol PlacesListConfigurator {
    func cofigure(with viewController: PlacesListViewController)
}

class DefaultPlacesListConfigurator: PlacesListConfigurator {
    
    func cofigure(with viewController: PlacesListViewController) {
        let presenter = DefaultPlacesListPresenter(view: viewController)
        let interactor = DefaultPlacesListInteractor(presenter: presenter)
        let router = DefaultPlacesListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
