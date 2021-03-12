//
//  File.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 12.03.2021.
//

import Foundation

class ProductStorageService {
    let userDefaults = UserDefaults.standard
    
    func checkInCartProductLocating(menuProduct: MenuProduct) -> Bool {
        if userDefaults.object(forKey: menuProduct.name) != nil {
            return true
        } else {
            return false
        }
    }
    
    func changeProductInCartState(menuProduct: MenuProduct) -> ProductInCartState{
        if userDefaults.object(forKey: menuProduct.name) != nil {
            userDefaults.removeObject(forKey: menuProduct.name)
            return .removedFromCart
        } else {
            userDefaults.setValue(1, forKey: menuProduct.name)
            return .addedToCart
        }
    }
}
