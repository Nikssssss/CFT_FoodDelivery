//
//  ServerService.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 11.03.2021.
//

import Foundation
import Firebase

class MenuServerService {
    let database = Firestore.firestore()
    let storageService: StorageService
    
    init(storageService: StorageService){
        self.storageService = storageService
    }
    
    func downloadProductsInfo(completion: @escaping (ProductTypes?, [MenuProduct]?) -> Void) {
        self.downloadProductTypes(completion: completion)
    }
}

private extension MenuServerService {
    func downloadProductTypes(completion: @escaping (ProductTypes?, [MenuProduct]?) -> Void) {
        self.database.collection("menu").document("productTypes").getDocument { [weak self] (snapshot, err) in
            let decoder = JSONDecoder()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let documentData = snapshot?.data(),
                   let data = try? JSONSerialization.data(withJSONObject: documentData),
                   let productTypes = try? decoder.decode(ProductTypes.self, from: data) {
                    self?.storageService.productTypes = productTypes
                    self?.downloadPizzaProducts(completion: completion)
                }
            }
        }
    }
    
    func downloadPizzaProducts(completion: @escaping (ProductTypes?, [MenuProduct]?) -> Void) {
        self.database.collection("menu").document("pizza").collection("kinds").getDocuments { [weak self] (querySnapshot, err) in
            let decoder = JSONDecoder()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self?.storageService.menuProducts["Пицца"] = [MenuProduct]()
                for document in querySnapshot!.documents {
                    if let data = try? JSONSerialization.data(withJSONObject: document.data()),
                       let menuProduct = try? decoder.decode(MenuProduct.self, from: data) {
                        self?.storageService.menuProducts["Пицца"]?.append(menuProduct)
                    }
                }
                self?.downloadDessertProducts(completion: completion)
            }
        }
    }
    
    func downloadDessertProducts(completion: @escaping (ProductTypes?, [MenuProduct]?) -> Void){
        self.database.collection("menu").document("desserts").collection("kinds").getDocuments { [weak self] (querySnapshot, err) in
            let decoder = JSONDecoder()
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self?.storageService.menuProducts["Десерты"] = [MenuProduct]()
                for document in querySnapshot!.documents {
                    if let data = try? JSONSerialization.data(withJSONObject: document.data()),
                       let menuProduct = try? decoder.decode(MenuProduct.self, from: data) {
                        self?.storageService.menuProducts["Десерты"]?.append(menuProduct)
                    }
                }
                completion(self?.storageService.productTypes, self?.storageService.menuProducts["Пицца"])
            }
        }
    }
}
