//
//  OrderViewController.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import UIKit

class OrderViewController: UIViewController {
    var presenter: OrderPresenterProtocol!
    
    weak var delegate: OrderViewControllerDelegate!
    
    private let userInfoStackView = UIStackView()
    private let contentView = UIView()
    private let addressWordLabel = UILabel()
    private let confirmButton = UIButton()
    private let orderInfoWordsLabel = UILabel()
    private let errorMessageLabel = UILabel()
    
    let nameInfoView = UserInfoView()
    let phoneInfoView = UserInfoView()
    let emailInfoView = UserInfoView()
    let cityInfoView = UserInfoView()
    let streetInfoView = UserInfoView()
    let houseNumberInfoView = UserInfoView()
    let apartmentNumberInfoView = UserInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configureView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.delegate.orderSceneWasClosed()
    }
}

extension OrderViewController: OrderViewControllerProtocol {
    func configureView(using userInfo: SavedUserInfo) {
        self.setupView()
        self.nameInfoView.userInfoTextField.text = userInfo.name ?? ""
        self.phoneInfoView.userInfoTextField.text = userInfo.phone ?? ""
        self.emailInfoView.userInfoTextField.text = userInfo.email ?? ""
    }
    
    func checkForBlankFields() -> Bool {
        let hasBlankFields = self.checkForBlankFields(in: [nameInfoView,
                                                          phoneInfoView,
                                                          emailInfoView,
                                                          cityInfoView,
                                                          streetInfoView,
                                                          houseNumberInfoView])
        return hasBlankFields
    }
    
    func setErrorMessages() {
        self.errorMessageLabel.text = "Пожалуйста, заполните все обязательные поля"
        self.setErrorColor(on: [nameInfoView,
                                phoneInfoView,
                                emailInfoView,
                                cityInfoView,
                                streetInfoView,
                                houseNumberInfoView])
    }
    
    func getOrderUserInfo() -> OrderUserInfo {
        let orderUserInfo = OrderUserInfo(name: self.nameInfoView.userInfoTextField.text!,
                                          phone: self.phoneInfoView.userInfoTextField.text!,
                                          email: self.emailInfoView.userInfoTextField.text!,
                                          city: self.cityInfoView.userInfoTextField.text!,
                                          street: self.streetInfoView.userInfoTextField.text!,
                                          house: self.houseNumberInfoView.userInfoTextField.text!,
                                          apartment: self.apartmentNumberInfoView.userInfoTextField.text!)
        return orderUserInfo
    }
}

private extension OrderViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupContentView()
        self.setupUserInfoStackView()
        self.setUserInfoStackViewElements()
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    func setupContentView() {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .always
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        scrollView.addSubview(self.contentView)
        self.contentView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.width.equalToSuperview()
        }
        self.contentView.backgroundColor = .white
    }
    
    func setupUserInfoStackView(){
        self.userInfoStackView.alignment = .center
        self.userInfoStackView.spacing = 10
        self.userInfoStackView.distribution = .equalSpacing
        self.userInfoStackView.axis = .vertical
        self.userInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.userInfoStackView)
        self.userInfoStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.bottom.equalToSuperview()
        }
        self.userInfoStackView.backgroundColor = .white
    }
    
    func setUserInfoStackViewElements() {
        self.setupWordsLabel(of: self.orderInfoWordsLabel, using: "Оформление заказа")
        self.setupUserInfoView(of: self.nameInfoView, titled: "Имя *")
        self.setupUserInfoView(of: self.phoneInfoView, titled: "Телефон *")
        self.setupUserInfoView(of: self.emailInfoView, titled: "E-mail *")
        self.setupWordsLabel(of: self.addressWordLabel, using: "Адрес доставки")
        self.setupUserInfoView(of: self.cityInfoView, titled: "Город *")
        self.setupUserInfoView(of: self.streetInfoView, titled: "Улица *")
        self.setupUserInfoView(of: self.houseNumberInfoView, titled: "Дом *")
        self.setupUserInfoView(of: self.apartmentNumberInfoView, titled: "Квартира")
        self.setupErrorMessageLabel()
        self.setupConfirmButton()
    }
    
    func setupWordsLabel(of label: UILabel, using title: String) {
        label.font  = .boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red: 80.0 / 255.0,
                                                  green: 80.0 / 255.0,
                                                  blue: 80.0 / 255.0,
                                                  alpha: 1.0)
        label.text = title
        label.backgroundColor = .white
        self.userInfoStackView.addArrangedSubview(label)
    }
    
    func setupConfirmButton() {
        self.confirmButton.setTitle("Подтвердить", for: .normal)
        self.confirmButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        self.confirmButton.setTitleColor(.white, for: .normal)
        self.confirmButton.backgroundColor = UIColor(red: 186.0 / 255.0,
                                                     green: 42.0 / 255.0,
                                                     blue: 42.0 / 255.0,
                                                     alpha: 1.0)
        self.confirmButton.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        self.confirmButton.layer.cornerRadius = 15
        self.userInfoStackView.addArrangedSubview(self.confirmButton)
        self.confirmButton.addTarget(self, action: #selector(self.confirmButtonPressed), for: .touchUpInside)
    }
    
    func setupUserInfoView(of userInfoView: UserInfoView, titled title: String) {
        userInfoView.userInfoLabel.text = title
        userInfoStackView.addArrangedSubview(userInfoView)
        userInfoView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
    }
    
    func setupErrorMessageLabel() {
        self.errorMessageLabel.textColor = .red
        self.errorMessageLabel.font = .systemFont(ofSize: 12, weight: .regular)
        self.userInfoStackView.addArrangedSubview(self.errorMessageLabel)
        self.errorMessageLabel.backgroundColor = .white
    }
    
    @objc func confirmButtonPressed() {
        self.presenter.confirmButtonPressed()
    }
    
    func checkForBlankFields(in fieldViews: [UserInfoView]) -> Bool {
        for fieldView in fieldViews {
            if fieldView.userInfoTextField.text == nil
                || fieldView.userInfoTextField.text!.isEmpty {
                return true
            }
        }
        return false
    }
    
    func setErrorColor(on fieldViews: [UserInfoView]) {
        for fieldView in fieldViews {
            if fieldView.userInfoTextField.text == nil
                || fieldView.userInfoTextField.text!.isEmpty {
                fieldView.userInfoLabel.textColor = .red
            }
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
