//
//  BannerCollectionViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 13.08.2023.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 20,
            leading: 0,
            bottom: 20,
            trailing: 0
        )
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    static let reuseID = "BannerCollectionCell"
    
    let nameLabel = NameLabel(style: .detail)
    let priceButton = OvalButton(style: .detail)
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
        priceButton.setTitle("от \(banner.price ?? 0) ₽", for: .normal)
        productImageView.image = UIImage(named: banner.image)
    }
}

extension BannerCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(productImageView)
        mainStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
