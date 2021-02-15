//
//  MapInteractor.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import Foundation
import RxSwift

protocol MapInteractor {
    func fetchWeather(with lon: Double, lat: Double)
}

class DefaultMapInteractor: MapInteractor {
        
    weak var presenter: MapPresenter!
    
    private let fetcher: WeatherDataFetcher
    private let disposbag = DisposeBag()
    
    required init(presenter: MapPresenter, fetcher: WeatherDataFetcher) {
        self.presenter = presenter
        self.fetcher = fetcher
    }
    
    func fetchWeather(with lon: Double, lat: Double) {
        fetcher.fetchWeather(with: lon, lat: lat).take(1).subscribe(onNext: { [weak self] result in
            switch result {
            case .success(let weather):
                self?.fetchDidFinish(weather)
            case .failure(let error):
            print(error.localizedDescription)
            }
            
        }).disposed(by: disposbag)
    }
    
    private func fetchDidFinish(_ weather: WeatherModel) {
        presenter.updateWeatherData(weather)
    }
}
