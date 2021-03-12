//
//  CartViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 11.03.2021.
//

import UIKit

class CartViewController: UIViewController {
    var presenter: CartPresenterProtocol!
    let assebmly: CartAssemblyProtocol = CartAssembly()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension CartViewController: CartViewControllerProtocol {
    
}
