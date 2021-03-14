//
//  MainTabBarController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 11.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        self.setupView()
        self.configureTabBarViewControllers()
    }
    
}

private extension MainTabBarController {
    func setupView() {
        self.tabBar.tintColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.tabBar.barTintColor = UIColor(red: 250.0 / 255.0, green: 250.0 / 255.0, blue: 250.0 / 255.0, alpha: 0.8)
    }
    
    func configureTabBarViewControllers() {
        let storageService = StorageService()
        let menuViewController = MenuAssembly.assemble(with: storageService)
        let cartViewController = CartAssembly.assemble(with: storageService)
        
        self.setupTabBarItem(of: menuViewController,
                             withTitle: "Меню",
                             withImageName: "list.bullet")
        self.setupTabBarItem(of: cartViewController,
                             withTitle: "Корзина",
                             withImageName: "cart.circle.fill")
        
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        let cartNavigationController = UINavigationController(rootViewController: cartViewController)
        
        self.viewControllers = [menuNavigationController, cartNavigationController]
        self.selectedViewController = menuNavigationController
    }
    
    func setupTabBarItem(of viewController: UIViewController,
                         withTitle title: String,
                         withImageName imageName: String){
        let tabBarItem = UITabBarItem()
        tabBarItem.title = title
        tabBarItem.image = UIImage(systemName: imageName)
        viewController.tabBarItem = tabBarItem
    }
}
