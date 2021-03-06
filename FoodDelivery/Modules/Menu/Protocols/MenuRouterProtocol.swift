//
//  MenuRouterProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol MenuRouterProtocol: class {
    func showProductScene(using menuProduct: MenuProduct, and storageService: StorageService)
}
