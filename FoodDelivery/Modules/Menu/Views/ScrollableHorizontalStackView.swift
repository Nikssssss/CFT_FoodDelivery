//
//  ScrollingStackView.swift
//  FoodDelivery
//
//  Created by Никита Гусев on 07.03.2021.
//

import UIKit

class ScrollableHorizontalStackView: UIScrollView {
    private var contentView: UIView!
    private var stackView: UIStackView!
    private var padding: CGFloat = 0
    
    var interItemSpacing: CGFloat! {
        didSet {
            self.stackView.spacing = self.interItemSpacing
        }
    }
    
    func setup(padding: CGFloat) {
        self.padding = padding
        self.setup()
    }
    
    func addBottomBorder(color: UIColor, width: CGFloat) {
        self.contentView.addBottomBorderWithColor(color: color, width: width)
    }
    
    func addSubview(subview: UIView){
        self.stackView.addArrangedSubview(subview)
    }
}

private extension ScrollableHorizontalStackView {
    func setup(){
        self.setupScrollView()
        self.setupStackView()
    }
    
    func setupScrollView() {
        self.contentView = UIView()
        self.addSubview(self.contentView)
        self.contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.contentView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    func setupStackView() {
        self.stackView = UIStackView()
        self.contentView.addSubview(self.stackView)
        self.stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding).isActive = true
        self.stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: padding).isActive = true
        self.stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        self.stackView.distribution = .equalSpacing
        self.stackView.axis = .horizontal
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.alignment = .center
    }
}
