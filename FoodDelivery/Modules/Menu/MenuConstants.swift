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
        static let productTypeButton = UIFont.boldSystemFont(ofSize: 16)
        
        static let productNameLabel = UIFont.systemFont(ofSize: 15, weight: .bold)
        static let productPriceLabel = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    struct Colors {
        static let viewBackground = UIColor.white
        static let productTypeStackViewBorder = UIColor.lightGray
        static let productTypeActiveButton = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        static let productTypeInactiveButton = UIColor.gray
        static let productTypeButtonBottomBorder = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        
        static let productNameLabel = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        static let productPriceLabel = UIColor.gray
        static let productPriceLabelBackground = UIColor.white
        static let addToCartButtonColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
    }
    
    struct Layout {
        static let productTypeStackViewPadding = CGFloat(20)
        static let productTypeStackViewHeight = 50
        static let productTypeStackViewInterItem = CGFloat(30)
        static let productTypeStackViewBorderWidth = CGFloat(0.33)
        static let productTypeButtonHeight = 50
        static let productTypeButtonBottomBorderWidth = CGFloat(1.5)
        
        static let productsTableViewTop = 20
        static let productsTableViewRowHeight = CGFloat(100)
    }
}
