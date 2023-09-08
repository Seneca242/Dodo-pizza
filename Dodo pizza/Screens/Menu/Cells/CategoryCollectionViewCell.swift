//
//  QuickSelectButtonCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 07.09.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "QuickSelectButtonCell"
    
    let categoryNameButton = OvalButton(style: .detail)
    
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
    
    func update(_ category: Category) {
        categoryNameButton.setTitle("\(category.name)", for: .normal)
    }
    
    
}

extension CategoryCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoryNameButton)
    }
    
    func setupConstraints() {
        
        categoryNameButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(85)
            make.height.equalTo(30)
        }
    }
}
