//
//  DetailWeatherViewController.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    
    var viewModel: DetailWeatherViewModel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: WebImageView!
    @IBOutlet weak var minAndMaxTempLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isScrollEnabled = false
        }
    }
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
     
        cityNameLabel.text = viewModel.cityName
        descriptionLabel.text = viewModel.description
        temperatureLabel.text = viewModel.temperature
        minAndMaxTempLabel.text = viewModel.minAndMaxTemp
        weatherImageView.set(imageURL: viewModel.iconURLString)
        setupSaveButton()
    }
    
    private func setupSaveButton() {
                
        if let _ = navigationController?.viewControllers[0] as? PlacesListViewController {
            saveButton.isHidden = true
            return
        }

        saveButton.layer.shadowColor = UIColor.lightGray.cgColor
        saveButton.layer.shadowOpacity = 0.7
        saveButton.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        saveButton.layer.shadowRadius = 5
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        viewModel.saveData()
    }
}

extension DetailWeatherViewController: UITableViewDelegate {
    
}

extension DetailWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWeatherTableViewCell", for: indexPath)
        
        let info = viewModel.cellForRowAt(index: indexPath.row)
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.description
        
        return cell
    }
}
