//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartInteractor {
    weak var presenter: CartPresenterProtocol!
    var storageService: StorageService!
    
    init(presenter: CartPresenter) {
        self.presenter = presenter
    }
}

extension CartInteractor: CartInteractorProtocol {
    func getAllInCartProducts() -> [CartProduct] {
        return self.storageService.getAllInCartProducts()
    }
    
    func incrementNumberOfItems(ofProductTitled title: String) -> Int {
        let incrementedNumber = self.storageService.incrementProductNumberInCart(titled: title)
        return incrementedNumber
    }
    
    func decrementNumberOfItems(ofProductTitled title: String) -> Int {
        let decrementedNumber = self.storageService.decrementProductNumberInCart(titled: title)
        return decrementedNumber
    }
    
    func removeInCartProduct(titled title: String) {
        self.storageService.removeProductFromCart(titled: title)
    }
}
