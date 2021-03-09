//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import UIKit

class AddressViewController: UIViewController {
    var presenter: AddressPresenterProtocol!
    let assembly: AddressAssemblyProtocol = AddressAssembly()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension AddressViewController: AddressViewControllerProtocol {
    
}
