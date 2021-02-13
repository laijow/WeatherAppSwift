//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit
import MapKit

protocol MapView: class {
    
}

class MapViewController: UIViewController {

    var presenter: MapPresenter!
    var configurator: MapConfigurator!
    var viewModel: MapViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator.configure(with: self)
    }
}

extension MapViewController: MapView {
    
}
