//
//  CartViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 11.03.2021.
//

import UIKit

class CartViewController: UIViewController {
    var presenter: CartPresenterProtocol!
    let assebmly: CartAssemblyProtocol = CartAssembly()
    var addStorageService: (() -> Void)!
    
    private let productsTableView = UITableView()
    private let cartCheckoutView = CartCheckoutView()
    
    var productList: [CartProduct]!
    var changeNumberButtons = [CartButtonType : [UIButton]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assebmly.assemble(with: self, andWith: addStorageService)
        self.presenter.configureView()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.presenter.viewWillAppear()
    }
}

extension CartViewController: CartViewControllerProtocol {
    func configureView(with menuProducts: [CartProduct]) {
        self.productList = menuProducts
        self.createChangeNumberButtons()
        self.setupView()
    }
    
    func setFinalCost(finalCost: Int) {
        self.cartCheckoutView.finalCostLabel.text = "К оплате: \(finalCost)p"
    }
    
    func updateProductList(with menuProducts: [CartProduct]) {
        self.productList = menuProducts
        self.createChangeNumberButtons()
        self.productsTableView.reloadData()
    }
    
    func removeProduct(titled title: String) {
        self.productList.removeAll { (product) in
            return product.name == title
        }
        self.productsTableView.reloadData()
    }
    
    func setNumberOfItems(ofProductTitled title: String, to number: Int) {
        for index in 0..<productList.count {
            if productList[index].name == title {
                productList[index].numberOfItems = number
                break
            }
        }
        self.productsTableView.reloadData()
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier,
                                                 for: indexPath) as! CartTableViewCell
        cell.productNameLabel.text = self.productList[indexPath.row].name
        cell.productImageView.sd_setImage(with: URL(string: productList[indexPath.row].imageURL),
                                          placeholderImage: UIImage(named: "placeholder.png"))
        cell.productPriceLabel.text = self.productList[indexPath.row].price
        let increaseButton = changeNumberButtons[.increase]![indexPath.row]
        let decreaseButton = changeNumberButtons[.decrease]![indexPath.row]
        cell.setButtons(increaseButton: increaseButton, decreaseButton: decreaseButton)
        cell.setNumberOfItems(numberOfItems: productList[indexPath.row].numberOfItems)
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

private extension CartViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupNavigationBar()
        self.setupCartCheckoutView()
        self.setupProductsTableView()
        self.tabBarController?.tabBar.isTranslucent = false
    }
    
    func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Корзина"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor(red: 186.0 / 255.0, green: 42.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupCartCheckoutView() {
        self.view.addSubview(self.cartCheckoutView)
        self.cartCheckoutView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
        self.cartCheckoutView.addTopBorderWithColor(color: .lightGray, width: 0.2)
        self.cartCheckoutView.makeOrderButton.addTarget(self,
                                                        action: #selector(self.makeOrderButtonPressed),
                                                        for: .touchUpInside)
    }
    
    func setupProductsTableView(){
        self.view.addSubview(self.productsTableView)
        self.productsTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalTo(self.cartCheckoutView.snp.top)
            make.left.right.equalToSuperview()
        }
        self.productsTableView.register(CartTableViewCell.self,
                                        forCellReuseIdentifier: CartTableViewCell.identifier)
        self.productsTableView.dataSource = self
        self.productsTableView.delegate = self
        self.productsTableView.separatorStyle = .none
    }
    
    @objc func makeOrderButtonPressed() {
        
    }
    
    func createChangeNumberButtons() {
        self.changeNumberButtons.removeAll()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .light, scale: .medium)
        self.changeNumberButtons[.increase] = []
        self.changeNumberButtons[.decrease] = []
        for index in 0..<productList.count {
            let increaseButton = UIButton()
            let decreaseButton = UIButton()
            increaseButton.setImage(UIImage(systemName: "plus")?
                                        .withConfiguration(imageConfig)
                                        .withRenderingMode(.alwaysOriginal), for: .normal)
            decreaseButton.setImage(UIImage(systemName: "minus")?
                                        .withConfiguration(imageConfig)
                                        .withRenderingMode(.alwaysOriginal), for: .normal)
            increaseButton.addTarget(self, action: #selector(increaseButtonPressed), for: .touchUpInside)
            decreaseButton.addTarget(self, action: #selector(decreaseButtonPressed), for: .touchUpInside)
            increaseButton.tag = index
            decreaseButton.tag = index
            self.changeNumberButtons[.increase]?.append(increaseButton)
            self.changeNumberButtons[.decrease]?.append(decreaseButton)
        }
    }
    
    @objc func increaseButtonPressed(sender: UIButton) {
        self.presenter.incrementNumberOfItemsPressed(titled: productList[sender.tag].name)
    }
    
    @objc func decreaseButtonPressed(sender: UIButton) {
        self.presenter.decrementNumberOfItemsPressed(titled: productList[sender.tag].name)
    }

}
