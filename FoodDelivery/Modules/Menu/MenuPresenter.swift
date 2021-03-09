//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuPresenter {
    weak var viewController: MenuViewControllerProtocol!
    var interactor: MenuInteractorProtocol!
    var router: MenuRouterProtocol!
    
    init(viewController: MenuViewController) {
        self.viewController = viewController
    }
}

extension MenuPresenter: MenuPresenterProtocol {
    
}
