//
//  UserInfo.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation

struct SavedUserInfo {
    let name: String?
    let phone: String?
    let email: String?
}

struct OrderUserInfo {
    let name: String
    let phone: String
    let email: String
    let city: String
    let street: String
    let house: String
    let apartment: String?
}
