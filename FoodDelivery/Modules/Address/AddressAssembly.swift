//
//  MenuAssembly.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class AddressAssembly: AddressAssemblyProtocol {
    func assemble(with viewController: AddressViewController) {
        let presenter = AddressPresenter(viewController: viewController)
        let interactor = AddressInteractor(presenter: presenter)
        let router = AddressRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

