//
//  MenuVIewControllerProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol MenuViewControllerProtocol: class {
    func configureView(withProductTypes productTypes: ProductTypes, withProductList productList: [MenuProduct])
    func replaceProductList(to productList: [MenuProduct])
    func replaceActiveTypeButtonByButton(titled title: String)
    func setInCartState(for productTag: Int, productType: ProductType)
    func setNotInCartState(for productTag: Int, productType: ProductType)
    func setInCartProducts(using menuProducts: [MenuProduct])
}
