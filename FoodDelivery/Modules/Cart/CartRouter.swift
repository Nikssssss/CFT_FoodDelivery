//
//  MenuRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartRouter {
    weak var viewController: CartViewController!
    
    init(viewController: CartViewController) {
        self.viewController = viewController
    }
}

extension CartRouter: CartRouterProtocol {
    func showOrderScene(using storageService: StorageService) {
        let orderViewController = OrderAssembly.assemble(with: storageService)
        orderViewController.delegate = self.viewController
        self.viewController.navigationController?.present(orderViewController, animated: true)
    }
}
