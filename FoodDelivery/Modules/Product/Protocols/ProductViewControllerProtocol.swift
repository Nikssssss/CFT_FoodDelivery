//
//  MenuVIewControllerProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol ProductViewControllerProtocol: class {
    func configureView(isProductInCart: Bool)
    func changeProductInCartState(to state: ProductInCartState)
}
