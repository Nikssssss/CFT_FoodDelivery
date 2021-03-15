//
//  CartCheckoutView.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 13.03.2021.
//

import UIKit

class CartCheckoutView: UIView {
    let orderButton = UIButton()
    let finalCostLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension CartCheckoutView {
    func setupView() {
        self.setupOrderButton()
        self.setupFinalCostLabel()
        self.backgroundColor = .white
    }
    
    func setupOrderButton() {
        self.addSubview(self.orderButton)
        self.orderButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        self.orderButton.setTitleColor(.white, for: .normal)
        self.orderButton.setTitle("Оформить", for: .normal)
        self.orderButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        self.orderButton.layer.cornerRadius = 15
    }
    
    func setupFinalCostLabel() {
        self.addSubview(self.finalCostLabel)
        self.finalCostLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30)
        }
        self.finalCostLabel.textColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.finalCostLabel.font = .boldSystemFont(ofSize: 15)
    }
}
