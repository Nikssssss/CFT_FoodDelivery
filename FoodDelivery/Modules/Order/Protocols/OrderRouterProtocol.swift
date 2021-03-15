//
//  OrderRouterProtocol.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import Foundation
import MessageUI

protocol OrderRouterProtocol: class {
    func showMailScene(using orderInfo: OrderInfo, completion: ((MFMailComposeViewController) -> Void))
    func showCartScene()
}
