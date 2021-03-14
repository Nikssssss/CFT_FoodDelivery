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
    
    func removeProductFromCart(titled title: String) {
        for productType in menuProducts {
            for product in productType.value {
                if product.name == title {
                    userDefaults.removeObject(forKey: product.name)
                    return
                }
            }
        }
    }
    
    func incrementProductNumberInCart(titled title: String) -> Int{
        var incrementedNumber = 0
        for productType in menuProducts {
            for product in productType.value {
                if product.name == title {
                    if let numberOfItems = userDefaults.object(forKey: product.name) as? Int {
                        incrementedNumber = numberOfItems + 1
                        userDefaults.setValue(incrementedNumber, forKey: product.name)
                        return incrementedNumber
                    }
                }
            }
        }
        return incrementedNumber
    }
    
    func decrementProductNumberInCart(titled title: String) -> Int {
        var incrementedNumber = 0
        for productType in menuProducts {
            for product in productType.value {
                if product.name == title {
                    if let numberOfItems = userDefaults.object(forKey: product.name) as? Int {
                        incrementedNumber = numberOfItems - 1
                        userDefaults.setValue(incrementedNumber, forKey: product.name)
                        return incrementedNumber
                    }
                }
            }
        }
        return incrementedNumber
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
    
    func getAllInCartProducts() -> [CartProduct] {
        var inCartProducts = [CartProduct]()
        for productType in menuProducts {
            for product in productType.value {
                if let numberOfItems = userDefaults.object(forKey: product.name) as? Int {
                    inCartProducts.append(CartProduct(name: product.name,
                                                      price: product.price,
                                                      imageURL: product.imageURL,
                                                      numberOfItems: numberOfItems))
                }
            }
        }
        return inCartProducts
    }
}
