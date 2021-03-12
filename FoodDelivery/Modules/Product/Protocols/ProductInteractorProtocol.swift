//
//  MenuInteractorProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol ProductInteractorProtocol: class {
    func checkInCartProductLocating(menuProduct: MenuProduct) -> Bool
    func changeProductInCartState(menuProduct: MenuProduct) -> ProductInCartState
}
