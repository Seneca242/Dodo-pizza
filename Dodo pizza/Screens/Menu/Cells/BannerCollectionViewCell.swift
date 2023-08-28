//
//  BannerCollectionViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 13.08.2023.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .leading
        
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 36, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    static let reuseID = "BannerCollectionCell"
    
    let nameLabel = NameLabel(style: .detail)
    let priceButton = PriceButton(style: .detail)
    let productImageView = ProductImageView(style: .menu)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(
            red: 248/255,
            green: 248/255,
            blue: 255/255,
            alpha: 1
        )
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
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(100)
            make.height.equalToSuperview().dividedBy(1)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).offset(0)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(productImageView)
        }
        
    }
}
