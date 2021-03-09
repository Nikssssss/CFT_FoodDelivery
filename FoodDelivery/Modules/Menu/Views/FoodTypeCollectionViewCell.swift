//
//  FoodTypeCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 08.03.2021.
//

import UIKit
import SnapKit

class FoodTypeCollectionViewCell: UICollectionViewCell {
    static let identifier = "FoodTypeCollectionViewCell"
    
    private var contentBottomBorderView: UIView?
    var foodTypeButton: UIButton?
    
    func configure(with button: UIButton) {
        guard button != foodTypeButton else { return }
        self.foodTypeButton = button
        self.contentView.addSubview(self.foodTypeButton!)
        self.foodTypeButton!.translatesAutoresizingMaskIntoConstraints = false
        self.foodTypeButton!.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func setActive(){
        self.contentBottomBorderView = self.contentView.addBottomBorderWithColor(color: .red,
                                                                                 width: 1.5)
        self.foodTypeButton!.setTitleColor(.red, for: .normal)
    }
    
    func setInactive(){
        self.foodTypeButton!.setTitleColor(.gray, for: .normal)
        self.contentBottomBorderView?.removeFromSuperview()
    }
}
