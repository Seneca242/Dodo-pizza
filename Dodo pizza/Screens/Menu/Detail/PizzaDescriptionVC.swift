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
    let productImageView = ProductImageView(style: .detail)
    
    let orderButtonView = OrderButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .white
        
        guard let pizza = pizza else {
            print("Error: Pizza not set!")
            return
        }
        
        update(pizza)
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
    
    private func setupConstraints() {
        addSubviews(subviews: productImageView, nameLabel, detailLabel, priceButton, orderButtonView)
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(8)
            make.leading.equalTo(view.snp.leading).offset(8)
            make.trailing.equalTo(view.snp.trailing).inset(8)
            make.centerX.equalTo(view.snp.centerX)
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
        
        orderButtonView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(16)
            make.bottom.equalTo(view).offset(16)
        }
    }
}
