//
//  MenuRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class AddressRouter {
    weak var viewController: AddressViewControllerProtocol!
    
    init(viewController: AddressViewController) {
        self.viewController = viewController
    }
}

extension AddressRouter: AddressRouterProtocol {
    
}
