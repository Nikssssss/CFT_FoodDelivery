//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    internal var presenter: MenuPresenterProtocol!
    internal let assembly: MenuAssemblyProtocol = MenuAssembly()
    
    private let foodTypeStackView = ScrollableHorizontalStackView()
    private let foodTypeNames = ["Пицца", "Бургеры", "Суши", "Напитки", "Десерты", "Закуски"]
    private var foodTypeButtons = [FoodTypeButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for name in foodTypeNames {
            let button = self.createFoodTypeButton(title: name,
                                                   titleFont: MenuConstants.Fonts.foodTypeButton)
            foodTypeButtons.append(FoodTypeButton(button: button, isActive: name == "Пицца"))
        }
        self.setupView()
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    
}

private extension MenuViewController {
    
    // MARK: appearance & layout methods
    
    func setupView(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = MenuConstants.Colors.viewBackground
        self.setupFoodTypeStackView()
    }
    
    func setupFoodTypeStackView(){
        self.view.addSubview(foodTypeStackView)
        self.foodTypeStackView.setup(padding: MenuConstants.Layout.foodTypeStackViewPadding)
        self.foodTypeStackView.snp.makeConstraints { (make) in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(MenuConstants.Layout.foodTypeStackViewHeight)
        }
        self.foodTypeStackView.interItemSpacing = MenuConstants.Layout.foodTypeStackViewInterItem
        self.foodTypeStackView.addBottomBorder(color: MenuConstants.Colors.foodTypeStackViewBorder,
                                               width: MenuConstants.Layout.foodTypeStackViewBorderWidth)
        for foodButton in foodTypeButtons {
            self.foodTypeStackView.addSubview(subview: foodButton.button)
            if foodButton.isActive {
                self.makeFoodTypeButtonActive(foodButton: foodButton)
            } else {
                self.makeFoodTypeButtonInactive(foodButton: foodButton)
            }
        }
    }
    
    // MARK: action methods
    
    func createFoodTypeButton(title: String,
                              titleFont: UIFont) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = titleFont
        button.snp.makeConstraints { (make) in
            make.height.equalTo(MenuConstants.Layout.foodTypeButtonHeight)
        }
        button.addTarget(self, action: #selector(foodTypeButtonPressed), for: .touchUpInside)
        return button
    }
    
    func makeFoodTypeButtonActive(foodButton: FoodTypeButton) {
        foodButton.button.setTitleColor(MenuConstants.Colors.foodTypeActiveButton, for: .normal)
        foodButton.isActive = true
        if let bottomBorder = foodButton.border {
            foodButton.button.addSubview(bottomBorder)
        } else {
            foodButton.border = foodButton.button.addBottomBorderWithColor(color: MenuConstants.Colors.foodTypeButtonBottomBorder,
                                                                           width: MenuConstants.Layout.foodTypeButtonBottomBorderWidth)
        }
    }
    
    func makeFoodTypeButtonInactive(foodButton: FoodTypeButton) {
        foodButton.button.setTitleColor(MenuConstants.Colors.foodTypeInactiveButton, for: .normal)
        foodButton.isActive = false
        foodButton.border?.removeFromSuperview()
    }
    
    func replaceActiveFoodTypeButtonByButton(titled title: String){
        for foodButton in foodTypeButtons {
            if foodButton.button.title(for: .normal) == title {
                self.makeFoodTypeButtonActive(foodButton: foodButton)
            } else if foodButton.isActive {
                self.makeFoodTypeButtonInactive(foodButton: foodButton)
            }
        }
    }
    
    @objc func foodTypeButtonPressed(sender: UIButton){
        guard let title = sender.title(for: .normal) else {
            return
        }
        replaceActiveFoodTypeButtonByButton(titled: title)
    }
}
