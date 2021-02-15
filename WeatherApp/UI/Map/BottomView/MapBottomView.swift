//
//  MapBottomView.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 14.02.2021.
//

import UIKit
import SnapKit

class MapBottomView: UIView {
        
    private var locationLabel: UILabel!
    
    private var temperatureLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        locationLabel = UILabel()
        temperatureLabel = UILabel()
        let defaultMargin: CGFloat = 16.0
        let labelMargin: CGFloat = 5.0
        let temperatureLabelWidth: CGFloat = 30.0
        let buttonSize: CGSize = CGSize(width: 120.0, height: 40.0)
        
        let detailButton = UIButton()
        
        detailButton.addTarget(nil,
                               action: #selector(MapViewController.showDetail(_:)),
                               for: .touchUpInside)
        
        detailButton.setTitle("Подробнее", for: .normal)
        detailButton.setTitleColor(.black, for: .normal)
        
        detailButton.backgroundColor = .lightGray
        detailButton.layer.cornerRadius = 6.0
        
        locationLabel.text = "Moscow"
        temperatureLabel.text = "-2"
        
        addSubview(locationLabel)
        addSubview(temperatureLabel)
        addSubview(detailButton)
        
        detailButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-defaultMargin)
            make.width.equalTo(buttonSize.width)
            make.height.equalTo(buttonSize.height)
        }

        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.bottom.equalTo(snp.bottom)
            make.width.equalTo(temperatureLabelWidth)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading).offset(defaultMargin)
            make.trailing.equalTo(temperatureLabel.snp.leading).offset(-labelMargin)
            make.bottom.equalTo(snp.bottom)
        }
    }
}
