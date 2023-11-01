//
//  PizzaDescriptionVC.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit
import SnapKit

class ProductDescriptionVC: UIViewController {
    
    //MARK: Properties
    var product: Product?
    
    //MARK: Services
    let cartStorage = StorageManager()
    let productStepper = CustomStepper()
    
    //MARK: UI Elements
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 0)
//        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    let nameLabel = NameLabel(style: .menu)
    let detailLabel = DetailLabel()
    let sizeDetailLabel = SizeDetailLabel()
    let productImageView = ProductImageView(style: .detail)
    let orderButtonView = OrderButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        orderButtonView.orderButton.isUserInteractionEnabled = true
        
        setupViews()
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
        sizeDetailLabel.text = product.sizeDetail
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

        guard let product = product else {
            print("Error: Product is not set!")
            return
        }
        cartStorage.save(product: product, quantity: 1)
        if let cartVC = navigationController?.viewControllers.first(where: { $0 is CartViewController }) as? CartViewController {
            let currentQuantity = cartVC.products.first(where: { $0.name == product.name })?.quantity ?? 0
            cartVC.updateProductInCart(product: product, newQuantity: currentQuantity + 1)
            cartVC.getProducts()
        }
    }
    
    //MARK: - Subviews and constraints
    private func addSubviewsToStack(subviews: UIView...) {
        subviews.forEach { subview in
            verticalStackView.addArrangedSubview(subview)
        }
    }
    
    private func addSubviewsToView(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupViews() {
        addSubviewsToView(
            subviews:
                productImageView,
                verticalStackView,
                orderButtonView
        )
        addSubviewsToStack(
            subviews:
                nameLabel,
                sizeDetailLabel,
                detailLabel
        )
    }
    
    private func setupConstraints() {
//        addSubviews(subviews: productImageView, nameLabel, sizeDetailLabel, detailLabel, orderButtonView)
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(8)
            make.leading.equalTo(view.snp.leading).offset(8)
            make.trailing.equalTo(view.snp.trailing).inset(8)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.leading.equalTo(view.snp.leading).offset(12)
            make.trailing.equalTo(view.snp.trailing).inset(30)
        }
        
//        nameLabel.snp.makeConstraints { make in
//            make.top.equalTo(productImageView.snp.bottom).offset(8)
//            make.leading.equalTo(view.snp.leading).offset(12)
//            make.trailing.equalTo(view.snp.trailing).inset(8)
//        }
//        
//        sizeDetailLabel.snp.makeConstraints { make in
//            make.top.equalTo(nameLabel.snp.bottom).offset(8)
//            make.leading.equalTo(view.snp.leading).offset(12)
//            make.trailing.equalTo(view.snp.trailing).inset(8)
//        }
//        
//        detailLabel.snp.makeConstraints { make in
//            make.top.equalTo(sizeDetailLabel.snp.bottom).offset(8)
//            make.leading.equalTo(view.snp.leading).offset(12)
//            make.trailing.equalTo(view.snp.trailing).inset(8)
//        }
        
        orderButtonView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
}

