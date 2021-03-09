//
//  MenyConstants.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 09.03.2021.
//

import Foundation
import UIKit

struct MenuConstants {
    struct Fonts {
        static let foodTypeButton = UIFont.boldSystemFont(ofSize: 16)
    }
    
    struct Colors {
        static let viewBackground = UIColor.white
        static let foodTypeStackViewBorder = UIColor.lightGray
        static let foodTypeActiveButton = UIColor.red
        static let foodTypeInactiveButton = UIColor.gray
        static let foodTypeButtonBottomBorder = UIColor.red
    }
    
    struct Layout {
        static let foodTypeStackViewPadding = CGFloat(20)
        static let foodTypeStackViewHeight = 50
        static let foodTypeStackViewInterItem = CGFloat(30)
        static let foodTypeStackViewBorderWidth = CGFloat(0.33)
        static let foodTypeButtonHeight = 50
        static let foodTypeButtonBottomBorderWidth = CGFloat(1.5)
    }
}
