//
//  MenuVIewControllerProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol CartViewControllerProtocol: class {
    func configureView(with menuProducts: [CartProduct])
    func setFinalCost(finalCost: Int)
    func updateProductList(with menuProducts: [CartProduct])
    func removeProduct(titled title: String)
    func setNumberOfItems(ofProductTitled title: String, to number: Int)
    func makeOrderButtonInactive()
    func makeOrderButtonActive()
}
