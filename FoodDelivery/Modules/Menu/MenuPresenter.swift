//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuPresenter {
    weak var viewController: MenuViewControllerProtocol!
    var interactor: MenuInteractorProtocol!
    var router: MenuRouterProtocol!
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
}

extension MenuPresenter: MenuPresenterProtocol {
    func configureView() {
        self.interactor.downloadProductsInfo { (optionalProductTypes, optionalProductList) in
            guard let productTypes = optionalProductTypes, let productList = optionalProductList else {
                print("configureView error")
                return
            }
            self.viewController.configureView(withProductTypes: productTypes, withProductList: productList)
            let inCartProducts = self.interactor.getInCartProducts(by: .pizza)
            self.viewController.setInCartProducts(using: inCartProducts)
        }
    }
    
    func productTypeButtonPressed(titled title: String, currentActiveButtonTitle: String) {
        guard title != currentActiveButtonTitle else {
            return
        }
        if title == "Пицца" || title == "Десерты" {
            if let menuProducts = self.interactor.getMenuProducts(typed: title) {
                self.viewController.replaceActiveTypeButtonByButton(titled: title)
                self.viewController.replaceProductList(to: menuProducts)
                let inCartProducts = self.interactor.getInCartProducts(by: ProductType(rawValue: title)!)
                self.viewController.setInCartProducts(using: inCartProducts)
            }
        }
    }
    
    func productCellPressed(with menuProduct: MenuProduct) {
        self.router.showProductScene(using: menuProduct)
    }
    
    func addToCartButtonPressed(tagged tag: Int, currentProductType: ProductType) {
        let productInCartState = self.interactor.changeProductInCartState(productTag: tag,
                                                                          productType: currentProductType)
        switch productInCartState {
        case .addedToCart:
            self.viewController.setInCartState(for: tag, productType: currentProductType)
        case .removedFromCart:
            self.viewController.setNotInCartState(for: tag, productType: currentProductType)
        }
    }
    
    func addStorageService(storageService: StorageService) {
        self.interactor.storageService = storageService
    }
}
