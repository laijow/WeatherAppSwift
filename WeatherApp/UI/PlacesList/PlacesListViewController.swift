//
//  PlacesListViewController.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

protocol PlacesListView: class {
    func displayData(viewModel: PlacesListViewModel)
}

class PlacesListViewController: UITableViewController {

    var configurator: PlacesListConfigurator!
    var presenter: PlacesListPresenter!
    var viewModel: PlacesListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        configurator.cofigure(with: self)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.getLocalWeather()
    }
    
    private func setupUI() {
        
        tableView.separatorStyle = .none
        setupCell()
    }
    
    private func setupCell() {
        tableView.register(UINib(nibName: PlacesListCell.reuseId, bundle: nil),
                           forCellReuseIdentifier: PlacesListCell.reuseId)
    }

}

extension PlacesListViewController: PlacesListView {
    func displayData(viewModel: PlacesListViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

// MARK: - Delegate
extension PlacesListViewController {
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetail(index: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter.deleteWeatherAt(index: indexPath.row)
    }
}

// MARK: - DataSource
extension PlacesListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlacesListCell.reuseId, for: indexPath)
        
        guard let placesListCell = cell as? PlacesListCell else { return cell }
        let viewModel = self.viewModel.cellViewModelAt(index: indexPath.row)
        placesListCell.configure(with: viewModel)
        
        return placesListCell
    }
}
