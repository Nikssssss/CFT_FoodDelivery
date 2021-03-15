//
//  OrderPresenter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation
import MessageUI

class OrderPresenter: NSObject {
    weak var viewController: OrderViewControllerProtocol!
    var interactor: OrderInteractorProtocol!
    var router: OrderRouterProtocol!
    
    init(viewController: OrderViewController) {
        self.viewController = viewController
    }
}

extension OrderPresenter: OrderPresenterProtocol {
    func configureView() {
        let userInfo = self.interactor.getSavedUserInfo()
        self.viewController.configureView(using: userInfo)
    }
    
    func confirmButtonPressed() {
        let hasBlankFields = self.viewController.checkForBlankFields()
        if hasBlankFields {
            self.viewController.setErrorMessages()
        } else {
            let orderUserInfo = self.viewController.getOrderUserInfo()
            let inCartProducts = self.interactor.getInCartProducts()
            let orderInfo = OrderInfo(orderUserInfo: orderUserInfo, products: inCartProducts)
            self.router.showMailScene(using: orderInfo) { [weak self] (mailViewController) in
                mailViewController.mailComposeDelegate = self
            }
        }
    }
}

extension OrderPresenter: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        if result == MFMailComposeResult.sent {
            self.interactor.removeAllInCartProducts()
            self.router.showCartScene()
        }
    }
}

