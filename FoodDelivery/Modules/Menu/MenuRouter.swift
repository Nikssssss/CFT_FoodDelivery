//
//  MenuRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuRouter {
    weak var viewController: MenuViewControllerProtocol!
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
}

extension MenuRouter: MenuRouterProtocol {
    
}
