//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class AddressInteractor {
    weak var presenter: AddressPresenterProtocol!
    
    init(presenter: AddressPresenter) {
        self.presenter = presenter
    }
}

extension AddressInteractor: AddressInteractorProtocol {
    
}
