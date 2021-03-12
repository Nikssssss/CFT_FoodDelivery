//
//  MenuInteractorProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol MenuInteractorProtocol: class {
    var storageService: StorageService! { get set }
    func downloadProductsInfo(completion: @escaping (ProductTypes?, [MenuProduct]?) -> Void)
    func getMenuProducts(typed type: String) -> [MenuProduct]?
    func changeProductInCartState(productTag: Int, productType: ProductType) -> ProductInCartState
    func getInCartProducts(by productType: ProductType) -> [MenuProduct]
}
