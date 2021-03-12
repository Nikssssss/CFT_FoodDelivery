//
//  MenuRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuRouter {
    weak var viewController: MenuViewController!
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
}

extension MenuRouter: MenuRouterProtocol {
    func showProductScene(using menuProduct: MenuProduct) {
        let productViewController = ProductViewController()
        productViewController.menuProduct = menuProduct
        productViewController.delegate = self.viewController
        let navigationController = self.viewController.createNavigationController(with: productViewController)
        self.viewController.navigationController?.present(navigationController, animated: true, completion: nil)
    }
}
