//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit
import MapKit
import SnapKit

protocol MapView: class {
    
}

class MapViewController: UIViewController {

    var presenter: MapPresenter!
    var configurator: MapConfigurator!
    var viewModel: MapViewModel!
    
    private let zoomOutTag: Int = 20
    private let zoomInTag: Int = 21
    
    private var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
        }
    }
    
    private var bottomView: MapBottomView!
    private var pinImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configurator.configure(with: self)
        setupUI()
    }
    
    private func setupUI() {
        
        setupMapView()
        setupPinImageView()
        setupButtons()
        setupBottomView()
    }
    
    @objc func showDetail(_ sender: UIButton) {
        print("show detail view controller")
        presenter.showDetail()
    }
}

// MARK: - Setups
extension MapViewController {
    
    private func setupMapView() {
        
        mapView = MKMapView()
                        
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.top.equalTo(view.snp.topMargin)
            make.bottom.equalTo(view.snp.bottomMargin)
        }
    }
    
    private func setupPinImageView() {
        
        let pinHeight: CGFloat = 30.0
        let pinWidth: CGFloat = 20.0
        let image = UIImage(systemName: "mappin")
        
        pinImageView = UIImageView(image: image)
        pinImageView.contentMode = .scaleAspectFill
        mapView.addSubview(pinImageView)
        
        pinImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(mapView.snp.centerX)
            make.centerY.equalTo(mapView.snp.centerY)
            make.height.equalTo(pinHeight)
            make.width.equalTo(pinWidth)
        }
    }
    
    private func setupButtons() {
        
        let margin: CGFloat = 16.0
        let imageConfig = UIImage.SymbolConfiguration(weight: .medium)
        let zoomOutButton = UIButton()
        let zoomInButton = UIButton()
        let buttonSize = CGSize(width: 50.0, height: 50.0)
        let zoomOutImage = UIImage(systemName: "minus.circle", withConfiguration: imageConfig)
        let zoomInImage = UIImage(systemName: "plus.circle", withConfiguration: imageConfig)
        
        zoomOutButton.tag = zoomOutTag
        zoomInButton.tag = zoomInTag
        
        zoomOutButton.addTarget(self, action: #selector(zoomTapped(_:)), for: .touchUpInside)
        zoomInButton.addTarget(self, action: #selector(zoomTapped(_:)), for: .touchUpInside)
        
        zoomOutButton.setImage(zoomOutImage, for: .normal)
        zoomInButton.setImage(zoomInImage, for: .normal)
                
        zoomOutButton.contentHorizontalAlignment = .fill
        zoomOutButton.contentVerticalAlignment = .fill
        zoomInButton.contentHorizontalAlignment = .fill
        zoomInButton.contentVerticalAlignment = .fill
        
        mapView.addSubview(zoomInButton)
        mapView.addSubview(zoomOutButton)
        
        zoomOutButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(mapView.snp.trailing).offset(-margin)
            make.centerY.equalTo(mapView.snp.centerY).offset(+(buttonSize.height/2))
            make.width.equalTo(buttonSize.width)
            make.height.equalTo(buttonSize.height)
        }
        
        zoomInButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(mapView.snp.trailing).offset(-margin)
            make.centerY.equalTo(mapView.snp.centerY).offset(-(buttonSize.height/2))
            make.width.equalTo(buttonSize.width)
            make.height.equalTo(buttonSize.height)
        }
    }
    
    private func setupBottomView() {
        
        let bottomViewHeight: CGFloat = 60.0
        let bottomView = MapBottomView()
                
        view.addSubview(bottomView)
        
        bottomView.snp.makeConstraints { (make) in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottomMargin)
            make.height.equalTo(bottomViewHeight)
        }
        
        bottomView.setupUI()
    }
    
    @objc private func zoomTapped(_ sender: UIButton) {
        let zoomValue: Double = 2.0
        let miximumZoonOut: Double = 180.0
        var region = mapView.region
        var latitudeDelta = region.span.latitudeDelta
        var longitudeDelta = region.span.longitudeDelta
        
        switch sender.tag {
        case zoomOutTag:
            latitudeDelta = min(region.span.latitudeDelta * zoomValue,
                                miximumZoonOut)
            longitudeDelta = min(region.span.longitudeDelta * zoomValue,
                                 miximumZoonOut)
        case zoomInTag:
            latitudeDelta /= zoomValue
            longitudeDelta /= zoomValue
        default: fatalError("Unknown tag")
        }
        region.span.latitudeDelta = longitudeDelta
        region.span.longitudeDelta = longitudeDelta
        mapView.setRegion(region, animated: true)
    }
}

extension MapViewController: MapView {
    
}

extension MapViewController: MKMapViewDelegate {
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
    
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print(mapView.region.center.latitude, mapView.region.center.longitude)
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        
        print("start")
        
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        let lon = mapView.region.center.longitude
        let lat = mapView.region.center.latitude
        presenter.getWeather(with: lon, lat: lat)
        print("finish")
    }
    
}
