//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuInteractor {
    weak var presenter: MenuPresenterProtocol!
    let storageService = StorageService()
    let serverService: MenuServerService
    
    init(presenter: MenuPresenter) {
        self.presenter = presenter
        self.serverService = MenuServerService(storageService: self.storageService)
    }
}

extension MenuInteractor: MenuInteractorProtocol {
    func downloadProductsInfo(completion: @escaping (ProductTypes?, [MenuProduct]?) -> Void) {
        serverService.downloadProductsInfo(completion: completion)
    }
    
    func getMenuProducts(typed type: String) -> [MenuProduct]? {
        return storageService.menuProducts[type]
    }
    
    func changeProductInCartState(productTag: Int, productType: ProductType) -> ProductInCartState {
        if self.storageService.checkProductInCartLocating(productTag: productTag,
                                                          productType: productType) == true {
            self.storageService.removeProductFromCart(productTag: productTag, productType: productType)
            return .removedFromCart
        } else {
            self.storageService.addProductToCart(productTag: productTag, productType: productType)
            return .addedToCart
        }
    }
    
    func getInCartProducts(by productType: ProductType) -> [MenuProduct] {
        return self.storageService.getInCartProducts(by: productType)
    }
}
