//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class AddressPresenter {
    weak var viewController: AddressViewControllerProtocol!
    var interactor: AddressInteractorProtocol!
    var router: AddressRouterProtocol!
    
    init(viewController: AddressViewController) {
        self.viewController = viewController
    }
}

extension AddressPresenter: AddressPresenterProtocol {
    
}
