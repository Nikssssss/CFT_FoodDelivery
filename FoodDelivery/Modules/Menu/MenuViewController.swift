//
//  MenuViewController.swift
//  ProductDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import UIKit
import SnapKit
import SDWebImage

class MenuViewController: UIViewController {
    internal var presenter: MenuPresenterProtocol!
    
    private let productTypeStackView = ScrollableHorizontalStackView()
    private var productTypeButtons = [ProductTypeButton]()
    private var currentProductType: ProductType!
    
    private let productsTableView = UITableView()
    private var productList: [MenuProduct]!
    private var addToCartButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard self.currentProductType != nil else {
            return
        }
        self.presenter.viewWillAppear(productType: currentProductType)
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    func configureView(withProductTypes productTypes: ProductTypes, withProductList productList: [MenuProduct]){
        self.productList = productList
        for type in productTypes.productTypes {
            let button = self.createProductTypeButton(title: type,
                                                   titleFont: MenuConstants.Fonts.productTypeButton)
            productTypeButtons.append(ProductTypeButton(button: button, isActive: type == "Пицца"))
        }
        self.setupView()
        self.currentProductType = .pizza
    }
    
    func replaceProductList(to productList: [MenuProduct]) {
        self.productList = productList
        self.createAddToCartButtons()
        self.productsTableView.reloadData()
    }
    
    func replaceActiveTypeButtonByButton(titled title: String) {
        self.replaceActiveProductTypeButtonByButton(titled: title)
        self.currentProductType = ProductType(rawValue: title)
    }
    
    func setInCartState(for productTag: Int, productType: ProductType) {
        if productType == self.currentProductType {
            self.addToCartButtons[productTag].isSelected = true
            self.productsTableView.reloadData()
        }
    }
    
    func setNotInCartState(for productTag: Int, productType: ProductType) {
        if productType == self.currentProductType {
            self.addToCartButtons[productTag].isSelected = false
            self.productsTableView.reloadData()
        }
    }
    
    func setInCartProducts(using menuProducts: [MenuProduct]) {
        var inCartProductIndexes = [Int]()
        for inCartProduct in menuProducts {
            for index in 0..<self.productList.count {
                if inCartProduct.name == self.productList[index].name {
                    self.addToCartButtons[index].isSelected = true
                    inCartProductIndexes.append(index)
                }
            }
        }
        for index in 0..<self.productList.count {
            let isInIndexes = inCartProductIndexes.contains(where: { (inCartProductIndex) -> Bool in
                return index == inCartProductIndex
            })
            if isInIndexes == false {
                self.addToCartButtons[index].isSelected = false
            }
        }
        self.productsTableView.reloadData()
    }
    
    func createNavigationController(with rootViewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: rootViewController)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier,
                                                 for: indexPath) as! ProductTableViewCell
        cell.productNameLabel.text = productList[indexPath.row].name
        cell.productPriceLabel.text = productList[indexPath.row].price
        cell.productImageView.sd_setImage(with: URL(string: productList[indexPath.row].imageURL),
                                          placeholderImage: UIImage(named: "placeholder.png"))
        cell.setAddToCartButton(button: self.addToCartButtons[indexPath.row])
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuConstants.Layout.productsTableViewRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.productCellPressed(with: productList[indexPath.row])
    }
}

extension MenuViewController: ProductViewControllerDelegate {
    func productSceneWasClosed(with menuProduct: MenuProduct,
                               withAddToCartButtonState state: ProductInCartState) {
        for index in 0..<self.productList.count {
            if self.productList[index].name == menuProduct.name {
                switch state {
                case .addedToCart:
                    self.addToCartButtons[index].isSelected = true
                case .removedFromCart:
                    self.addToCartButtons[index].isSelected = false
                }
            }
        }
    }
}

private extension MenuViewController {
    
    // MARK: appearance & layout methods
    
    func setupView(){
        self.view.backgroundColor = MenuConstants.Colors.viewBackground
        self.setupNavigationBar()
        self.setupProductTypeStackView()
        self.setupProductsTableView()
    }
    
    func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Food Delivery"
        titleLabel.font = UIFont(name: "Chalkboard SE Bold", size: 23)
        titleLabel.textColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupProductTypeStackView(){
        self.view.addSubview(self.productTypeStackView)
        self.productTypeStackView.setup(padding: MenuConstants.Layout.productTypeStackViewPadding)
        self.productTypeStackView.snp.makeConstraints { (make) in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(MenuConstants.Layout.productTypeStackViewHeight)
        }
        self.productTypeStackView.interItemSpacing = MenuConstants.Layout.productTypeStackViewInterItem
        self.productTypeStackView.addBottomBorder(color: MenuConstants.Colors.productTypeStackViewBorder,
                                               width: MenuConstants.Layout.productTypeStackViewBorderWidth)
        for productButton in self.productTypeButtons {
            self.productTypeStackView.addSubview(subview: productButton.button)
            if productButton.isActive {
                self.makeProductTypeButtonActive(productButton: productButton)
            } else {
                self.makeProductTypeButtonInactive(productButton: productButton)
            }
        }
    }
    
    func setupProductsTableView(){
        self.view.addSubview(self.productsTableView)
        self.productsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(productTypeStackView.snp.bottom).offset(MenuConstants.Layout.productsTableViewTop)
            make.left.right.bottom.equalToSuperview()
        }
        self.productsTableView.register(ProductTableViewCell.self,
                                        forCellReuseIdentifier: ProductTableViewCell.identifier)
        self.createAddToCartButtons()
        self.productsTableView.dataSource = self
        self.productsTableView.delegate = self
        self.productsTableView.separatorStyle = .none
    }
    
    // MARK: action methods
    
    func createProductTypeButton(title: String,
                              titleFont: UIFont) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = titleFont
        button.snp.makeConstraints { (make) in
            make.height.equalTo(MenuConstants.Layout.productTypeButtonHeight)
        }
        button.addTarget(self, action: #selector(productTypeButtonPressed), for: .touchUpInside)
        return button
    }
    
    func makeProductTypeButtonActive(productButton: ProductTypeButton) {
        productButton.button.setTitleColor(MenuConstants.Colors.productTypeActiveButton, for: .normal)
        productButton.isActive = true
        if let bottomBorder = productButton.border {
            productButton.button.addSubview(bottomBorder)
        } else {
            productButton.border =
                productButton.button.addBottomBorderWithColor(color: MenuConstants.Colors.productTypeButtonBottomBorder,
                                                              width: MenuConstants.Layout.productTypeButtonBottomBorderWidth)
        }
    }
    
    func makeProductTypeButtonInactive(productButton: ProductTypeButton) {
        productButton.button.setTitleColor(MenuConstants.Colors.productTypeInactiveButton, for: .normal)
        productButton.isActive = false
        productButton.border?.removeFromSuperview()
    }
    
    func replaceActiveProductTypeButtonByButton(titled title: String){
        for productButton in self.productTypeButtons {
            if productButton.button.title(for: .normal) == title {
                self.makeProductTypeButtonActive(productButton: productButton)
            } else if productButton.isActive {
                self.makeProductTypeButtonInactive(productButton: productButton)
            }
        }
    }
    
    func getActiveProductTypeButtonTitle() -> String {
        for button in productTypeButtons {
            if button.isActive {
                return button.button.title(for: .normal)!
            }
        }
        return String()
    }
    
    @objc func productTypeButtonPressed(sender: UIButton){
        self.presenter.productTypeButtonPressed(titled: sender.title(for: .normal)!,
                                                currentActiveButtonTitle: self.getActiveProductTypeButtonTitle())
    }
    
    func createAddToCartButtons() {
        self.addToCartButtons.removeAll()
        for index in 0..<productList.count{
            let button = UIButton()
            let imageConfig = UIImage.SymbolConfiguration(pointSize: 28, weight: .light, scale: .medium)
            let notInCartImage = UIImage(systemName: "cart.badge.plus")?
                .withTintColor(MenuConstants.Colors.addToCartButtonColor)
                .withRenderingMode(.alwaysOriginal)
                .withConfiguration(imageConfig)
            let inCartImage = UIImage(systemName: "cart.fill.badge.minus")?
                .withTintColor(MenuConstants.Colors.addToCartButtonColor)
                .withRenderingMode(.alwaysOriginal)
                .withConfiguration(imageConfig)
            button.setImage(notInCartImage, for: .normal)
            button.setImage(inCartImage, for: .selected)
            button.addTarget(self, action: #selector(self.addToCartButtonPressed(sender:)), for: .touchUpInside)
            button.tag = index
            self.addToCartButtons.append(button)
        }
    }
    
    @objc func addToCartButtonPressed(sender: UIButton) {
        self.presenter.addToCartButtonPressed(tagged: sender.tag,
                                              currentProductType: self.currentProductType)
    }
}
