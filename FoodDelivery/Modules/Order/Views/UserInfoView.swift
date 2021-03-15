//
//  UserInfoView.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 15.03.2021.
//

import UIKit

class UserInfoView: UIView {
    let userInfoLabel = UILabel()
    let userInfoTextField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UserInfoView {
    func setupView() {
        self.setupInfoLabel()
        self.setupInfoTextField()
        self.backgroundColor = .white
    }
    
    func setupInfoLabel() {
        self.addSubview(self.userInfoLabel)
        self.userInfoLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        self.userInfoLabel.font = .systemFont(ofSize: 13)
        self.userInfoLabel.textColor = .gray
        self.userInfoLabel.backgroundColor = .white
    }
    
    func setupInfoTextField() {
        self.addSubview(self.userInfoTextField)
        self.userInfoTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.userInfoLabel.snp.bottom).offset(5)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(37)
        }
        self.userInfoTextField.layer.cornerRadius = 5
        self.userInfoTextField.setLeftPaddingPoints(10)
        self.userInfoTextField.backgroundColor = UIColor(red: 240.0 / 255.0,
                                                         green: 240.0 / 255.0,
                                                         blue: 240.0 / 255.0,
                                                         alpha: 1.0)
        self.userInfoTextField.autocorrectionType = .no
        self.userInfoTextField.autocapitalizationType = .none
        self.userInfoTextField.textColor = .black
    }
}
