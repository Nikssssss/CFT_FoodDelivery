//
//  ProductViewControllerDelegate.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 12.03.2021.
//

import Foundation

protocol ProductViewControllerDelegate: class {
    func productSceneWasClosed(with menuProduct: MenuProduct, withAddToCartButtonState state: ProductInCartState)
}
