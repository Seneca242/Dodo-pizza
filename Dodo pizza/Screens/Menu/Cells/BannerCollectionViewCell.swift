//
//  BannerCollectionViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 13.08.2023.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "BannerCollectionCell"
    
    let nameLabel = NameLabel(style: .detail)
    let priceButton = PriceButton(style: .cart)
    let productImageView = ProductImageView(style: .menu)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ banner: Banner) {
        nameLabel.text = banner.name
        priceButton.setTitle("от \(banner.price) ₽", for: .normal)
        productImageView.image = UIImage(named: banner.image)
    }
    
    
}

extension BannerCollectionViewCell {
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(priceButton)
        addSubview(productImageView)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        priceButton.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right)
            make.top.equalTo(nameLabel.snp.bottom)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
