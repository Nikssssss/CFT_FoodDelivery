//
//  OrderInteractorProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation

protocol OrderInteractorProtocol: class {
    func getSavedUserInfo() -> SavedUserInfo
    func getInCartProducts() -> [CartProduct]
    func removeAllInCartProducts()
}
