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
    
    var onCategoryTapped: ((Category) -> ())?
    var category: Category?
    
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
        setupActions()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ category: Category) {
        self.category = category
        categoryNameButton.setTitle("\(category.name)", for: .normal)
    }
    
    
}

//MARK: - Event Handler (Actions)
extension CategoryCollectionViewCell {
    func setupActions() {
        categoryNameButton.addTarget(
            self,
            action: #selector(categoryButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc func categoryButtonTapped() {
        if let category {
            onCategoryTapped?(category)
        }
    }
}

extension CategoryCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoryNameButton)
    }
    
    func setupConstraints() {
        
        categoryNameButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.left.right.equalTo(contentView)
            make.height.equalTo(40)
            make.width.greaterThanOrEqualTo(100)
        }
    }
}
