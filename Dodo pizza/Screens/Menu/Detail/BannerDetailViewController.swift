//
//  BannerDetailViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 21.09.2023.
//

import UIKit
import SnapKit

class BannerDetailViewController: UIViewController {
    
    var bannerProduct: Banner?
    var grayOrderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(
            red: 220/255,
            green: 220/255,
            blue: 220/255,
            alpha: 1
        )
        button.setTitle("16 шт", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return button
    }()
    
    let nutritionInfoView = NutritionInfoView()
//    let nutritionInfoButtonView = NutritionInfoButtonView()
    
    let bannerDetailProductImageView = ProductImageView(style: .menu)
    let bannerDetailProductDescription = DetailLabel()
    let bannerDetailProductName = NameLabel(style: .menu)
    
    let orderButtonView = OrderButtonView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        grayOrderButton.isHidden = true
        
        guard let bannerProduct = bannerProduct else {
            print("Error: Pizza not set!")
            return
        }
        
        update(bannerProduct)
        setupNutritionInfoViewAnimation()
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap))
//        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func update(_ bannerProduct: Banner) {
        bannerDetailProductName.text = bannerProduct.name
        orderButtonView.orderButton.setTitle("В корзину за \(bannerProduct.price ?? 0) ₽", for: .normal)
        bannerDetailProductImageView.image = UIImage(named: bannerProduct.image)
        bannerDetailProductDescription.text = bannerProduct.description
        grayOrderButton.isHidden = !bannerProduct.isGrayButtonVisible
        nutritionInfoView.updateInfoView(with: bannerProduct)
    }
    
    private func setupViews() {
        addSubviews(subViews:
            bannerDetailProductImageView,
            bannerDetailProductName,
//            nutritionInfoButtonView,
            bannerDetailProductDescription,
            grayOrderButton,
            orderButtonView,
            nutritionInfoView
        )
    }
    
    private func setupConstraints() {
        
        nutritionInfoView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(600)
        }
        
        nutritionInfoView.nutritionInfoButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.top.equalTo(bannerDetailProductImageView.snp.bottom).offset(40)
        }
        
        nutritionInfoView.nutritionInfoButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.top.equalTo(bannerDetailProductImageView.snp.bottom).offset(40)
        }
        
        bannerDetailProductImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.height.equalTo(200)
        }
        
//        nutritionInfoButtonView.snp.makeConstraints { make in
//            make.trailing.equalToSuperview().inset(20)
//            make.top.equalTo(bannerDetailProductImageView.snp.bottom).offset(40)
//        }
        
        bannerDetailProductName.snp.makeConstraints { make in
            make.top.equalTo(bannerDetailProductImageView.snp.bottom).offset(40)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(nutritionInfoView.nutritionInfoButton.snp.trailing).inset(20)
        }
        
        bannerDetailProductDescription.snp.makeConstraints { make in
            make.top.equalTo(bannerDetailProductName.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        grayOrderButton.snp.makeConstraints { make in
            make.top.equalTo(bannerDetailProductDescription.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        orderButtonView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-65)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
}

//MARK: - Animation to hide NutritionInfoView
extension BannerDetailViewController {
    
    private func setupNutritionInfoViewAnimation() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap))
        self.view.addGestureRecognizer(tapGesture)
    }
}

//MARK: - Event Handler (Actions)
extension BannerDetailViewController {
    
    @objc private func handleScreenTap() {
        if !nutritionInfoView.nutritionInfoView.isHidden {
            hideNutritionInfoView()
        }
    }
    
    private func hideNutritionInfoView() {
        UIView.animate(withDuration: 0.6) {
            self.nutritionInfoView.nutritionInfoView.alpha = 0
        } completion: { _ in
            self.nutritionInfoView.nutritionInfoView.isHidden = true
            self.nutritionInfoView.nutritionInfoView.alpha = 1
        }
    }
}

