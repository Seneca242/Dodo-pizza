//
//  BigBannerCollectionViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 14.09.2023.
//

import UIKit

import SnapKit

class BigBannerCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "BigBannerCollectionCell"
    
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
        productImageView.image = UIImage(named: banner.image)
    }
}

extension BigBannerCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(productImageView)
    }
    
    func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(productImageView.snp.width).multipliedBy(1.5)
        }
    }
}

