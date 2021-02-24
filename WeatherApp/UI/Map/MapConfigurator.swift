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
    
    private let component: WeatherUIComponent
    
    init(component: WeatherUIComponent) {
        self.component = component
    }
    
    func configure(with viewController: MapViewController) {
        let networkService = NetworkService()
        let mapper = WeatherMapper()
        let localService = DefaultLocalService()
        let fetcher = NetworkDataFetcher(networking: networkService)
        let fetcherService = DataFetcherService(networkDataFetcher: fetcher)
        let presenter = DefaultMapPresenter(view: viewController, mapper: mapper)
        let interactor = DefaultMapInteractor(presenter: presenter,
                                              fetcher: fetcherService,
                                              localService: localService)
        let router = DefaultMapRouter(viewController: viewController, component: component)

        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
