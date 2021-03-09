//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class ProductInteractor {
    weak var presenter: ProductPresenterProtocol!
    
    init(presenter: ProductPresenter) {
        self.presenter = presenter
    }
}

extension ProductInteractor: ProductInteractorProtocol {
    
}
