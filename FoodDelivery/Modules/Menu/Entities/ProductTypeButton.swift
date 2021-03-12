//
//  FoodTypeButton.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 09.03.2021.
//

import Foundation
import UIKit

class ProductTypeButton {
    var button: UIButton
    var border: UIView?
    var isActive: Bool
    
    init(button: UIButton, isActive: Bool) {
        self.button = button
        self.isActive = isActive
    }
}
