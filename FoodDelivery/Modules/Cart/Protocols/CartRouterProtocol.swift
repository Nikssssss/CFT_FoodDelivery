//
//  MenuRouterProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol CartRouterProtocol: class {
    func showOrderScene(using storageService: StorageService)
}
