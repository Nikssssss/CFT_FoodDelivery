//
//  MenuInteractorProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol CartInteractorProtocol: class {
    var storageService: StorageService! { get set }
    func getAllInCartProducts() -> [CartProduct]
    func incrementNumberOfItems(ofProductTitled title: String) -> Int
    func decrementNumberOfItems(ofProductTitled title: String) -> Int
    func removeInCartProduct(titled title: String)
}
