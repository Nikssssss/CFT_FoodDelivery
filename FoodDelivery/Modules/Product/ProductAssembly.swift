//
//  MenuAssembly.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductAssembly {
    class func assemble(menuProduct: MenuProduct,
                        delegate: ProductViewControllerDelegate,
                        storageService: StorageService) -> ProductViewController {
        let viewController = ProductViewController()
        let presenter = ProductPresenter(viewController: viewController)
        let interactor = ProductInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        
        viewController.menuProduct = menuProduct
        viewController.delegate = delegate
        
        interactor.storageService = storageService
        
        return viewController
    }
}

