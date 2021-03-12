//
//  MainTabBarController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 11.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let storageService = StorageService()
        let menuViewController = MenuViewController()
        menuViewController.addStorageService = {
            menuViewController.presenter.addStorageService(storageService: storageService)
        }
        let tabMenuViewController = self.setupTab(viewController: menuViewController, tabBarTitle: "Меню", tabBarImageName: "list.bullet")
        let tabCartViewController = self.setupTab(viewController: CartViewController(), tabBarTitle: "Корзина", tabBarImageName: "cart.circle.fill")
        self.viewControllers = [tabMenuViewController, tabCartViewController]
        self.selectedViewController = tabMenuViewController
        self.tabBar.tintColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.tabBar.barTintColor = UIColor(red: 250.0 / 255.0, green: 250.0 / 255.0, blue: 250.0 / 255.0, alpha: 0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

private extension MainTabBarController {
    func setupTab(viewController: UIViewController, tabBarTitle: String, tabBarImageName: String) -> UIViewController{
        let navigationController = UINavigationController(rootViewController: viewController)
        let tabBarItem = UITabBarItem()
        tabBarItem.title = tabBarTitle
        tabBarItem.image = UIImage(systemName: tabBarImageName)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}
