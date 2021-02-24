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
    
    private let component: WeatherUIComponent
    
    init(component: WeatherUIComponent) {
        self.component = component
    }
    
    func cofigure(with viewController: PlacesListViewController) {
        let presenter = DefaultPlacesListPresenter(view: viewController)
        let interactor = DefaultPlacesListInteractor(presenter: presenter, localService: DefaultLocalService())
        let router = DefaultPlacesListRouter(viewController: viewController, component: component)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
