//
//  UICollectionVIew + Extension.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 09.03.2021.
//

import Foundation
import UIKit

extension UICollectionView {
    func addBottomBorder(color: UIColor, width: CGFloat){
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.addBottomBorderWithColor(color: color, width: width)
    }
}
