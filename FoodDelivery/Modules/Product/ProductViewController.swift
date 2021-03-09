//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import UIKit

class ProductViewController: UIViewController {
    var presenter: ProductPresenterProtocol!
    let assembly: ProductAssemblyProtocol = ProductAssembly()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ProductViewController: ProductViewControllerProtocol {
    
}
