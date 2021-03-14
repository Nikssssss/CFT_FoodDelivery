//
//  MenuPresenterProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol MenuPresenterProtocol: class {
    func configureView()
    func productTypeButtonPressed(titled title: String, currentActiveButtonTitle: String)
    func productCellPressed(with menuProduct: MenuProduct)
    func addToCartButtonPressed(tagged tag: Int, currentProductType: ProductType)
    func addStorageService(storageService: StorageService)
    func viewWillAppear(productType: ProductType)
}
