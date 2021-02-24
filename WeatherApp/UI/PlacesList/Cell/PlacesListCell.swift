//
//  PlacesListCell.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

class PlacesListCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    static let reuseId = "PlacesListCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with viewModel: PlacesListCellViewModel) {
        cityNameLabel.text = viewModel.cityName
        temperatureLabel.text = viewModel.temperature
    }
}
