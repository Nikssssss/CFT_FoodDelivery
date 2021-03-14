//
//  UIView + Extension.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 09.03.2021.
//

import Foundation
import UIKit

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = UIView()
        self.addSubview(border)
        border.backgroundColor = color
        border.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(width)
        }
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.addSubview(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) -> UIView{
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: width)
        self.addSubview(border)
        return border
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.addSubview(border)
    }
}
