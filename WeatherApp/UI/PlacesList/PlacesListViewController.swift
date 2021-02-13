//
//  PlacesListViewController.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

protocol PlacesListView: class {
    
}

class PlacesListViewController: UITableViewController {

    var configurator: PlacesListConfigurator!
    var presenter: PlacesListPresenter!
    var viewModel: PlacesListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        configurator.cofigure(with: self)
        setupUI()
    }
    
    func setupUI() {
        
        setupCell()
    }
    
    func setupCell() {
        tableView.register(UINib(nibName: PlacesListCell.reuseId, bundle: nil),
                           forCellReuseIdentifier: PlacesListCell.reuseId)
    }

}

extension PlacesListViewController: PlacesListView {
    
}

// MARK: - Delegate
extension PlacesListViewController {
    
}

// MARK: - DataSource
extension PlacesListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlacesListCell.reuseId, for: indexPath)
        
        return cell
    }
}
