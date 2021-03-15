//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartPresenter {
    weak var viewController: CartViewControllerProtocol!
    var interactor: CartInteractorProtocol!
    var router: CartRouterProtocol!
    
    init(viewController: CartViewController) {
        self.viewController = viewController
    }
}

extension CartPresenter: CartPresenterProtocol {
    
    func configureView() {
        let inCartProducts = self.interactor.getAllInCartProducts()
        self.viewController.configureView(with: inCartProducts)
        self.viewController.setFinalCost(finalCost: self.calculateFinalCost(from: inCartProducts))
    }
    
    func viewWillAppear() {
        let inCartProducts = self.interactor.getAllInCartProducts()
        let finalCost = self.calculateFinalCost(from: inCartProducts)
        self.viewController.updateProductList(with: inCartProducts)
        self.viewController.setFinalCost(finalCost: finalCost)
        if inCartProducts.count == 0 {
            self.viewController.makeOrderButtonInactive()
        } else {
            self.viewController.makeOrderButtonActive()
        }
    }
    
    func incrementNumberOfItemsPressed(titled title: String) {
        let incrementedNumber = self.interactor.incrementNumberOfItems(ofProductTitled: title)
        self.viewController.setNumberOfItems(ofProductTitled: title, to: incrementedNumber)
        let finalCost = self.calculateFinalCost(from: self.interactor.getAllInCartProducts())
        self.viewController.setFinalCost(finalCost: finalCost)
    }
    
    func decrementNumberOfItemsPressed(titled title: String) {
        let decrementedNumber = self.interactor.decrementNumberOfItems(ofProductTitled: title)
        if decrementedNumber == 0 {
            self.interactor.removeInCartProduct(titled: title)
            self.viewController.removeProduct(titled: title)
        } else {
            self.viewController.setNumberOfItems(ofProductTitled: title, to: decrementedNumber)
        }
        let inCartProducts = self.interactor.getAllInCartProducts()
        let finalCost = self.calculateFinalCost(from: inCartProducts)
        self.viewController.setFinalCost(finalCost: finalCost)
        if inCartProducts.count == 0 {
            self.viewController.makeOrderButtonInactive()
        }
    }
    
    func orderButtonPressed() {
        if self.interactor.getAllInCartProducts().count != 0 {
            self.router.showOrderScene(using: self.interactor.storageService)
        }
    }
}

private extension CartPresenter {
    func calculateFinalCost(from inCartProducts: [CartProduct]) -> Int {
        var finalCost = 0
        for product in inCartProducts {
            if let index = product.price.firstIndex(of: "p"),
               let price = Int(product.price.prefix(upTo: index)) {
                finalCost += price * product.numberOfItems
            }
            else if let index = product.price.firstIndex(of: "р"),
                    let price = Int(product.price.prefix(upTo: index)) {
                finalCost += price * product.numberOfItems
            }
        }
        return finalCost
    }
}
