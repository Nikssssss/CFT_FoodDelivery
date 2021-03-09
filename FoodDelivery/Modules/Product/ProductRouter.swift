//
//  MenuRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductRouter {
    weak var viewController: ProductViewControllerProtocol!
    
    init(viewController: ProductViewController) {
        self.viewController = viewController
    }
}

extension ProductRouter: ProductRouterProtocol {
    
}
