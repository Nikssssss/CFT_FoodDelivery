//
//  MenuAssembly.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuAssembly: MenuAssemblyProtocol {
    func assemble(with viewController: MenuViewController) {
        let presenter = MenuPresenter(viewController: viewController)
        let interactor = MenuInteractor(presenter: presenter)
        let router = MenuRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

