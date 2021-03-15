//
//  OrderInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation

class OrderInteractor {
    weak var presenter: OrderPresenterProtocol!
    
    var storageService: StorageService!
    
    init(presenter: OrderPresenterProtocol) {
        self.presenter = presenter
    }
}

extension OrderInteractor: OrderInteractorProtocol {
    func getSavedUserInfo() -> SavedUserInfo {
        let userInfo = self.storageService.getSavedUserInfo()
        return userInfo
    }
    
    func getInCartProducts() -> [CartProduct] {
        let inCartProducts = self.storageService.getAllInCartProducts()
        return inCartProducts
    }
    
    func removeAllInCartProducts() {
        self.storageService.removeAllInCartProducts()
    }
}
