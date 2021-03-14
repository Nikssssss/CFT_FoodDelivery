//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductInteractor {
    weak var presenter: ProductPresenterProtocol!
    
    var storageService: StorageService!
    
    init(presenter: ProductPresenter) {
        self.presenter = presenter
    }
}

extension ProductInteractor: ProductInteractorProtocol {
    func checkInCartProductLocating(menuProduct: MenuProduct) -> Bool{
        let isInCart = self.storageService.checkInCartProductLocating(menuProduct: menuProduct)
        if isInCart {
            return true
        } else {
            return false
        }
    }
    
    func changeProductInCartState(menuProduct: MenuProduct) -> ProductInCartState {
        let productInCartState = self.storageService.changeProductInCartState(menuProduct: menuProduct)
        return productInCartState
    }
}
