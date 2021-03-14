//
//  MenuAssembly.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartAssembly {
    class func assemble(with storageService: StorageService) -> CartViewController {
        let viewController = CartViewController()
        let presenter = CartPresenter(viewController: viewController)
        let interactor = CartInteractor(presenter: presenter)
        let router = CartRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.storageService = storageService
        
        return viewController
    }
}

