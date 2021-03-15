//
//  File.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation

class OrderAssembly {
    class func assemble(with storageService: StorageService) -> OrderViewController {
        let viewController = OrderViewController()
        let presenter = OrderPresenter(viewController: viewController)
        let interactor = OrderInteractor(presenter: presenter)
        let router = OrderRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.storageService = storageService
        
        return viewController
    }
}
