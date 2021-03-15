//
//  OrderViewControllerProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation

protocol OrderViewControllerProtocol: class {
    func configureView(using userInfo: SavedUserInfo)
    func checkForBlankFields() -> Bool
    func setErrorMessages()
    func getOrderUserInfo() -> OrderUserInfo
}
