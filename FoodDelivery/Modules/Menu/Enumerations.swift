//
//  Enumerations.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 12.03.2021.
//

import Foundation

enum ProductInCartState {
    case addedToCart
    case removedFromCart
}

enum ProductType: String {
    case pizza = "Пицца"
    case desserts = "Десерты"
}
