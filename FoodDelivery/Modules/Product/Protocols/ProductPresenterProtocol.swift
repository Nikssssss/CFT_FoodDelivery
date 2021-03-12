//
//  MenuPresenterProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

protocol ProductPresenterProtocol: class {
    func configureView(with menuProduct: MenuProduct)
    func productOrderButtonPressed(menuProduct: MenuProduct)
}
