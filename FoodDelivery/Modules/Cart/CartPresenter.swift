//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartPresenter {
    weak var viewController: CartViewControllerProtocol!
    var interactor: CartInteractorProtocol!
    var router: CartRouterProtocol!
    
    init(viewController: CartViewController) {
        self.viewController = viewController
    }
}

extension CartPresenter: CartPresenterProtocol {
    
}
