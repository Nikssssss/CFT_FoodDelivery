//
//  StorageService.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 11.03.2021.
//

import Foundation

class StorageService {
    private let userDefaults = UserDefaults.standard
    
    var productTypes: ProductTypes!
    var menuProducts = [String : [MenuProduct]]()
    
    func checkProductInCartLocating(productTag: Int, productType: ProductType) -> Bool{
        let productKey = menuProducts[productType.rawValue]![productTag].name
        if userDefaults.object(forKey: productKey) != nil{
            return true
        } else {
            return false
        }
    }
    
    func addProductToCart(productTag: Int, productType: ProductType) {
        let productKey = menuProducts[productType.rawValue]![productTag].name
        userDefaults.setValue(1, forKey: productKey)
    }
    
    func removeProductFromCart(productTag: Int, productType: ProductType) {
        let productKey = menuProducts[productType.rawValue]![productTag].name
        userDefaults.removeObject(forKey: productKey)
    }
    
    func incrementProductNumberInCart(productTag: Int, productType: ProductType) {
        let productKey = menuProducts[productType.rawValue]![productTag].name
        let previousNumber = userDefaults.object(forKey: productKey) as! Int
        let currentNumber = previousNumber + 1
        userDefaults.setValue(currentNumber, forKey: productKey)
    }
    
    func decrementProductNumberInCart(productTag: Int, productType: ProductType) -> Int {
        let productKey = menuProducts[productType.rawValue]![productTag].name
        let previousNumber = userDefaults.object(forKey: productKey) as! Int
        let currentNumber = previousNumber - 1
        userDefaults.setValue(currentNumber, forKey: productKey)
        return currentNumber
    }
    
    func getInCartProducts(by productType: ProductType) -> [MenuProduct] {
        var inCartProducts = [MenuProduct]()
        for product in menuProducts[productType.rawValue]! {
            if userDefaults.object(forKey: product.name) != nil {
                inCartProducts.append(product)
            }
        }
        return inCartProducts
    }
}
