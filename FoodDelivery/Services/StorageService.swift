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
    
    func getSavedUserInfo() -> SavedUserInfo {
        let name: String? = userDefaults.object(forKey: "userName") as? String
        let phone: String? = userDefaults.object(forKey: "userPhone") as? String
        let email: String? = userDefaults.object(forKey: "userEmail") as? String
        return SavedUserInfo(name: name, phone: phone, email: email)
    }
    
    func setSavedUserInfo(using userInfo: SavedUserInfo) {
        userDefaults.setValue(userInfo.name!, forKey: "userName")
        userDefaults.setValue(userInfo.phone!, forKey: "userPhone")
        userDefaults.setValue(userInfo.email, forKey: "userEmail")
    }
    
    func removeAllInCartProducts() {
        for productType in menuProducts {
            for product in productType.value {
                if userDefaults.object(forKey: product.name) != nil {
                    userDefaults.removeObject(forKey: product.name)
                }
            }
        }
    }
}
