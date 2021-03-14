//
//  MenuAssembly.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuAssembly {
    class func assemble(with storageService: StorageService) -> MenuViewController {
        let viewController = MenuViewController()
        let presenter = MenuPresenter(viewController: viewController)
        let interactor = MenuInteractor(presenter: presenter)
        let router = MenuRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.storageService = storageService
        
        return viewController
    }
}

