//
//  OrderRouter.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation
import MessageUI

class OrderRouter: NSObject {
    weak var viewController: OrderViewController!
    
    init(viewController: OrderViewController) {
        self.viewController = viewController
    }
}

extension OrderRouter: OrderRouterProtocol {
    func showMailScene(using orderInfo: OrderInfo,
                       completion: ((MFMailComposeViewController) -> Void)) {
        if MFMailComposeViewController.canSendMail() {
            let mailViewController = MFMailComposeViewController()
            mailViewController.setSubject("Заказ из Food Delivery")
            mailViewController.setPreferredSendingEmailAddress(orderInfo.orderUserInfo.email)
            mailViewController.setToRecipients(["nikitagyssev@gmail.com"])
            let htmlOrderText = self.createHtmlOrderText(using: orderInfo)
            mailViewController.setMessageBody(htmlOrderText, isHTML: true)
            completion(mailViewController)
            
            self.viewController.present(mailViewController, animated: true)
        }
    }
    
    func showCartScene() {
        self.viewController.dismiss(animated: true)
    }
}

private extension OrderRouter {
    func createHtmlOrderText(using orderInfo: OrderInfo) -> String{
        let title = "<p>Новый заказ</p><br>"
        let userInfo =
            """
        <p>Имя: \(orderInfo.orderUserInfo.name)</p>
        <p>Телефон: \(orderInfo.orderUserInfo.phone)</p>
        <p>E-mail: \(orderInfo.orderUserInfo.email)</p>
        <br>
        <p>Адрес доставки</p>
        <p>Город: \(orderInfo.orderUserInfo.city)</p>
        <p>Улица: \(orderInfo.orderUserInfo.street)</p>
        <p>Дом: \(orderInfo.orderUserInfo.house)</p>
        <p>Квартира: \(orderInfo.orderUserInfo.apartment ?? "")</p>
        <br>
        <p>Содержимое заказа</p>
        """
        var productsInfo = ""
        for product in orderInfo.products {
            productsInfo.append("<p>\(product.name) x \(product.numberOfItems)</p>")
        }
        return title + userInfo + productsInfo
    }
}
