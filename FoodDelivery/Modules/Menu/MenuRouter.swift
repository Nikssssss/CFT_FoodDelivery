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
    func showProductScene(using menuProduct: MenuProduct, and storageService: StorageService) {
        let productViewController = ProductAssembly.assemble(menuProduct: menuProduct,
                                                             delegate: self.viewController,
                                                             storageService: storageService)
        self.viewController.navigationController?.present(productViewController, animated: true, completion: nil)
    }
}
