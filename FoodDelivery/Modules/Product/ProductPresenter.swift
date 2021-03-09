//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductPresenter {
    weak var viewController: ProductViewControllerProtocol!
    var interactor: ProductInteractorProtocol!
    var router: ProductRouterProtocol!
    
    init(viewController: ProductViewController) {
        self.viewController = viewController
    }
}

extension ProductPresenter: ProductPresenterProtocol {
    
}
