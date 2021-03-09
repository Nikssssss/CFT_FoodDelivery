//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import Foundation

class MenuInteractor {
    weak var presenter: MenuPresenterProtocol!
    
    init(presenter: MenuPresenter) {
        self.presenter = presenter
    }
}

extension MenuInteractor: MenuInteractorProtocol {
    
}
