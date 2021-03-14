//
//  MenuPresenterProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol CartPresenterProtocol: class {
    func addStorageService(storageService: StorageService)
    func configureView()
    func viewWillAppear()
    func incrementNumberOfItemsPressed(titled title: String)
    func decrementNumberOfItemsPressed(titled title: String)
}
