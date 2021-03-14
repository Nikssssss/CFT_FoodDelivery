//
//  ProductTableViewCell.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 09.03.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "ProductTableViewCell"

    internal var productImageView = UIImageView()
    internal var productNameLabel = UILabel()
    internal var productPriceLabel = UILabel()
    internal var addToCartButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAddToCartButton(button: UIButton) {
        if addToCartButton != nil {
            self.addToCartButton.removeFromSuperview()
        }
        self.addToCartButton = button
        self.setupAddToCartButton()
        self.setupProductPriceLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        self.contentView.layer.cornerRadius = 10
    }
}

private extension ProductTableViewCell {
    func setupView() {
        self.selectionStyle = .none
        self.contentView.layer.borderWidth = 0.6
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.setupProductImageView()
        self.setupProductNameLabel()
    }
    
    func setupProductImageView() {
        self.contentView.addSubview(self.productImageView)
        self.productImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        self.productImageView.contentMode = .scaleToFill
    }
    
    func setupProductNameLabel() {
        self.contentView.addSubview(self.productNameLabel)
        self.productNameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.productImageView.snp.right).offset(7)
            make.height.equalTo(20)
        }
        self.productNameLabel.font = MenuConstants.Fonts.productNameLabel
        self.productNameLabel.textColor = MenuConstants.Colors.productNameLabel
    }
    
    func setupAddToCartButton() {
        self.contentView.addSubview(self.addToCartButton)
        self.addToCartButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(30)
        }
    }
    
    func setupProductPriceLabel() {
        self.contentView.addSubview(self.productPriceLabel)
        self.productPriceLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.addToCartButton.snp.left).offset(-12)
            make.height.equalTo(25)
            make.width.equalTo(50)
        }
        self.productPriceLabel.font = MenuConstants.Fonts.productPriceLabel
        self.productPriceLabel.backgroundColor = MenuConstants.Colors.productPriceLabelBackground
        self.productPriceLabel.textColor = MenuConstants.Colors.productPriceLabel
        self.productPriceLabel.textAlignment = .center
        self.productPriceLabel.layer.borderWidth = 1.0
        self.productPriceLabel.layer.borderColor = MenuConstants.Colors.productPriceLabel.cgColor
        self.productPriceLabel.layer.cornerRadius = 8
        self.productPriceLabel.layer.masksToBounds = true
    }
}
