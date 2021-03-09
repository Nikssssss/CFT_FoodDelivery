//
//  MenuAssembly.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductAssembly: ProductAssemblyProtocol {
    func assemble(with viewController: ProductViewController) {
        let presenter = ProductPresenter(viewController: viewController)
        let interactor = ProductInteractor(presenter: presenter)
        let router = ProductRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

