//
//  CartTableViewCell.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 12.03.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    static let identifier = "CartTableViewCell"

    internal let productImageView = UIImageView()
    internal let productNameLabel = UILabel()
    internal let productPriceLabel = UILabel()
    private var increaseNumberButton: UIButton!
    private var decreaseNumberButton: UIButton!
    internal var numberOfItemsLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButtons(increaseButton: UIButton, decreaseButton: UIButton) {
        if self.increaseNumberButton != nil {
            self.increaseNumberButton.removeFromSuperview()
        }
        if self.decreaseNumberButton != nil {
            self.decreaseNumberButton.removeFromSuperview()
        }
        self.increaseNumberButton = increaseButton
        self.decreaseNumberButton = decreaseButton
        self.setupIncreaseNumberButton()
        self.setupNumberOfItemsLabel()
        self.setupDecreaseNumberButton()
    }
    
    func setNumberOfItems(numberOfItems: Int) {
        self.numberOfItemsLabel.text = "\(numberOfItems)"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        self.contentView.addBottomBorderWithColor(color: .lightGray, width: 0.2)
    }

}

private extension CartTableViewCell {
    func setupView() {
        self.selectionStyle = .none
        self.setupProductImageView()
        self.setupProductNameLabel()
        self.setupProductPriceLabel()
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
    
    func setupProductPriceLabel() {
        self.contentView.addSubview(self.productPriceLabel)
        self.productPriceLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(25)
            make.width.equalTo(50)
        }
        self.productPriceLabel.font = MenuConstants.Fonts.productPriceLabel
        self.productPriceLabel.backgroundColor = MenuConstants.Colors.productPriceLabelBackground
        self.productPriceLabel.textColor = MenuConstants.Colors.productPriceLabel
        self.productPriceLabel.layer.borderColor = MenuConstants.Colors.productPriceLabel.cgColor
        self.productPriceLabel.layer.borderWidth = 1.0
        self.productPriceLabel.textAlignment = .center
        self.productPriceLabel.layer.cornerRadius = 8
        self.productPriceLabel.layer.masksToBounds = true
    }
    
    func setupIncreaseNumberButton() {
        self.contentView.addSubview(self.increaseNumberButton)
        self.increaseNumberButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.productPriceLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func setupNumberOfItemsLabel() {
        self.contentView.addSubview(self.numberOfItemsLabel)
        self.numberOfItemsLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.increaseNumberButton)
            make.right.equalTo(self.increaseNumberButton.snp.left).offset(-8)
        }
        self.numberOfItemsLabel.font = .systemFont(ofSize: 16, weight: .medium)
        self.numberOfItemsLabel.textColor = .gray
        self.numberOfItemsLabel.textAlignment = .center
    }
    
    func setupDecreaseNumberButton() {
        self.contentView.addSubview(self.decreaseNumberButton)
        self.decreaseNumberButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.productPriceLabel.snp.bottom).offset(10)
            make.right.equalTo(self.numberOfItemsLabel.snp.left).offset(-8)
        }
    }
}
