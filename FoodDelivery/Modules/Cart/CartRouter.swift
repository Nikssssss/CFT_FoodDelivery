//
//  MenuRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartRouter {
    weak var viewController: CartViewControllerProtocol!
    
    init(viewController: CartViewController) {
        self.viewController = viewController
    }
}

extension CartRouter: CartRouterProtocol {
    
}
