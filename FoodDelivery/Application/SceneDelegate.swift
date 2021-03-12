//
//  SceneDelegate.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 06.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MainTabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }
}

