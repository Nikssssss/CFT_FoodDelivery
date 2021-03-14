//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductPresenter {
    weak var viewController: ProductViewControllerProtocol!
    var interactor: ProductInteractorProtocol!
    
    init(viewController: ProductViewController) {
        self.viewController = viewController
    }
}

extension ProductPresenter: ProductPresenterProtocol {
    func configureView(with menuProduct: MenuProduct) {
        let isProductInCart = self.interactor.checkInCartProductLocating(menuProduct: menuProduct)
        self.viewController.configureView(isProductInCart: isProductInCart)
    }
    
    func productAddToCartButtonPressed(menuProduct: MenuProduct) {
        let productInCartState = self.interactor.changeProductInCartState(menuProduct: menuProduct)
        self.viewController.changeProductInCartState(to: productInCartState)
    }
}
