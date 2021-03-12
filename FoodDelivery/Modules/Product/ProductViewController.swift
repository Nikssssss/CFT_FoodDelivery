//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import UIKit
import SDWebImage

class ProductViewController: UIViewController {
    var presenter: ProductPresenterProtocol!
    let assembly: ProductAssemblyProtocol = ProductAssembly()
    
    var menuProduct: MenuProduct!
    
    weak var delegate: ProductViewControllerDelegate!
    
    private let productTitleLabel = UILabel()
    private let productImageView = UIImageView()
    private let productDescriptionTextView = UITextView()
    private let productOrderButton = UIButton()
    private let productPriceLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.assembly.assemble(with: self)
        self.presenter.configureView(with: self.menuProduct)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let addToCartButtonState: ProductInCartState = productOrderButton.isSelected ? .addedToCart : .removedFromCart
        delegate.productSceneWasClosed(with: menuProduct, withAddToCartButtonState: addToCartButtonState)
    }

}

extension ProductViewController: ProductViewControllerProtocol {
    func configureView(isProductInCart: Bool) {
        self.setupView()
        if isProductInCart {
            self.changeOrderButtonState(to: .addedToCart)
        } else {
            self.changeOrderButtonState(to: .removedFromCart)
        }
    }
    
    func changeProductInCartState(to state: ProductInCartState) {
        self.changeOrderButtonState(to: state)
    }
}

private extension ProductViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        self.setupProductTitleLabel()
        self.setupProductImageView()
        self.setupProductDescriptionTextView()
        self.setupProductOrderButton()
        self.setupProductPriceLabel()
    }
    
    func setupProductTitleLabel() {
        self.view.addSubview(self.productTitleLabel)
        self.productTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        self.productTitleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        self.productTitleLabel.textColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.productTitleLabel.text = self.menuProduct.name
    }
    
    func setupProductImageView() {
        self.view.addSubview(self.productImageView)
        self.productImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.productTitleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(280)
        }
        self.productImageView.contentMode = .scaleToFill
        self.productImageView.sd_setImage(with: URL(string: self.menuProduct.imageURL), completed: nil)
    }
    
    func setupProductDescriptionTextView() {
        self.view.addSubview(self.productDescriptionTextView)
        self.productDescriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(self.productImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(300)
        }
        self.productDescriptionTextView.textColor = .gray
        self.productDescriptionTextView.font = .systemFont(ofSize: 12, weight: .light)
        self.productDescriptionTextView.text = self.menuProduct.description
    }
    
    func setupProductOrderButton() {
        self.view.addSubview(self.productOrderButton)
        self.productOrderButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-50)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        self.productOrderButton.addTarget(self, action: #selector(self.orderButtonPressed), for: .touchUpInside)
        self.productOrderButton.setTitleColor(.white, for: .normal)
        self.productOrderButton.setTitle("В корзину", for: .normal)
        self.productOrderButton.setTitle("В корзине", for: .selected)
        self.productOrderButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        self.productOrderButton.layer.cornerRadius = 15
    }
    
    func setupProductPriceLabel() {
        self.view.addSubview(self.productPriceLabel)
        self.productPriceLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(35)
            make.centerY.equalTo(self.productOrderButton)
            make.width.equalTo(55)
            make.height.equalTo(30)
        }
        self.productPriceLabel.font = .systemFont(ofSize: 15, weight: .regular)
        self.productPriceLabel.textColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.productPriceLabel.layer.borderWidth = 0.5
        self.productPriceLabel.layer.borderColor = UIColor(red: 186.0 / 255.0,
                                                           green: 42.0 / 255.0,
                                                           blue: 42.0 / 255.0,
                                                           alpha: 1.0).cgColor
        self.productPriceLabel.text = self.menuProduct.price
        self.productPriceLabel.textAlignment = .center
        self.productPriceLabel.layer.cornerRadius = 10
    }
    
    @objc func orderButtonPressed() {
        self.presenter.productOrderButtonPressed(menuProduct: self.menuProduct)
    }
    
    func changeOrderButtonState(to state: ProductInCartState) {
        switch state {
        case .addedToCart:
            self.productOrderButton.backgroundColor = .gray
            self.productOrderButton.isSelected = true
        case .removedFromCart:
            self.productOrderButton.backgroundColor = UIColor(red: 186.0 / 255.0,
                                                              green: 42.0 / 255.0,
                                                              blue: 42.0 / 255.0,
                                                              alpha: 1.0)
            self.productOrderButton.isSelected = false
        }
    }
}
