//
//  PizzaDescriptionVC.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit
import SnapKit

class PizzaDescriptionVC: UIViewController {
    
    var pizza: Product?
    
    let nameLabel = NameLabel()
    let priceButton = PriceButton()
    let detailLabel = DetailLabel()
    let productImageView = ProductImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .white
        
        guard let pizza = pizza else {
            print("Error: Pizza not set!")
            return
        }
        
        update(pizza)
        createTabbar()
    }

    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle("\(product.price) р", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }

    private func addSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func createTabbar() {
        let tabbar = UITabBarController()
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        appearance.backgroundColor = UIColor(
            red: 183/255,
            green: 65/255,
            blue: 14/255,
            alpha: 1
        )
        
        tabbar.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabbar.tabBar.scrollEdgeAppearance = appearance
        } else {
            tabbar.tabBar.isTranslucent = true
        }
        tabbar.tabBar.tintColor = .white
        tabbar.tabBar.unselectedItemTintColor = .yellow
        
        guard let pizza = pizza else {
            print("Error: Pizza not set!")
            return
        }
        
        let priceItem = UITabBarItem(title: "\(pizza.price) р", image: nil, selectedImage: nil)
        let viewController = UIViewController()
        viewController.tabBarItem = priceItem
        tabbar.viewControllers = [viewController]
        
        addChild(tabbar)
        view.addSubview(tabbar.view)
        tabbar.didMove(toParent: self)
        
        tabbar.view.snp.makeConstraints { make in
            make.bottom.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(50)
        }
    }
    
    private func setupConstraints() {
        addSubviews(subviews: productImageView, nameLabel, detailLabel, priceButton)
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(8)
            make.leading.equalTo(view.snp.leading).offset(8)
            make.trailing.equalTo(view.snp.trailing).inset(8)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(productImageView.snp.width).multipliedBy(0.9)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(12)
            make.trailing.equalTo(view.snp.trailing).inset(8)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(12)
            make.trailing.equalTo(view.snp.trailing).inset(8)
        }
    }
}
