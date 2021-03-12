//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class CartInteractor {
    weak var presenter: CartPresenterProtocol!
    
    init(presenter: CartPresenter) {
        self.presenter = presenter
    }
}

extension CartInteractor: CartInteractorProtocol {
    
}
