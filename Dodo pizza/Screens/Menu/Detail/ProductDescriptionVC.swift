//
//  PizzaDescriptionVC.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit
import SnapKit

class ProductDescriptionVC: UIViewController {
    
    var product: Product?
    
    let nameLabel = NameLabel(style: .menu)
    let detailLabel = DetailLabel()
    let productImageView = ProductImageView(style: .detail)
    
    let orderButtonView = OrderButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        orderButtonView.orderButton.isUserInteractionEnabled = true
        
        setupConstraints()
        setupOrderButton()

        guard let product = product else {
            print("Error: Product is not set!")
            return
        }
        update(product)
        setupActions()
    }
    
    private func setupOrderButton() {
//        orderButtonView.backgroundColor = UIColor(
//            red: 248/255,
//            green: 248/255,
//            blue: 255/255,
//            alpha: 1
//        )
        
        guard let product = product else {
            print("Error: Pizza not set!")
            return
        }
        orderButtonView.orderButton.setTitle(
            "В корзину за \(String(describing: product.price)) ₽", for: .normal
        )
    }
    
    
    //MARK: - Business logic
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        productImageView.image = UIImage(named: product.image)
    }
    
    func setupActions() {
        orderButtonView.orderButton.addTarget(
            self,
            action: #selector(putProductToTheBasket),
            for: .touchUpInside
        )
    }
    
    //MARK: - Event handler (Actions)
    @objc private func putProductToTheBasket() {
        let basketVC = BasketViewController()
        guard let product = product else {
            print("Error: Product is not set!")
            return
        }
        basketVC.products.append(product)
    }
    
    //MARK: - Subviews and constraints
    private func addSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupConstraints() {
        addSubviews(subviews: productImageView, nameLabel, detailLabel, orderButtonView)
        
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
//            make.leading.trailing.equalTo(view).inset(0)
//            make.bottom.equalTo(view).inset(30)
            make.height.equalTo(100)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}

