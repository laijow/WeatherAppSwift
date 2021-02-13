//
//  WeatherTabBarController.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 13.02.2021.
//

import UIKit

class WeatherTabBarController: UITabBarController {
    
    private let component: WeatherUIComponent
    
    init(component: WeatherUIComponent) {
        self.component = component
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        tabBar.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let mapViewController = component.makeMapViewController()
        let placesListViewController = component.makePlacesListViewController()
        
        let imageConfig = UIImage.SymbolConfiguration(weight: .medium)
        let mapImage = UIImage(systemName: "map", withConfiguration: imageConfig)!
        let listImage = UIImage(systemName: "list.dash", withConfiguration: imageConfig)!
        
        viewControllers = [
            generateNavigationController(rootViewController: mapViewController,
                                         title: "Карта", image: mapImage),
            generateNavigationController(rootViewController: placesListViewController,
                                         title: "Список мест", image: listImage)
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController,
                                              title: String,
                                              image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    
}
