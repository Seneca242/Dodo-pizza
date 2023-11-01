//
//  BigPizzaTableCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 02.10.2023.
//

import UIKit
import SnapKit

class BigPizzaTableCell: UITableViewCell {
    
    static let reuseID = "BigPizzaTableCell"
    
    let backgroundBigPizzaView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(
            red: 245/255,
            green: 245/255,
            blue: 245/255,
            alpha: 1
        )
        view.layer.cornerRadius = 10
        return view
    }()
    
    let nameLabel = NameLabel(style: .menu)
    let priceButton = OvalButton(style: .menu)
    let detailLabel = DetailLabel()
    let productImageView = ProductImageView(style: .menu)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        detailLabel.text = product.detail
        priceButton.setTitle("от \(product.price) ₽", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }
}

extension BigPizzaTableCell {
    private func setupViews() {
        contentView.addSubview(backgroundBigPizzaView)
        contentView.addSubview(productImageView)
        backgroundBigPizzaView.addSubview(nameLabel)
        backgroundBigPizzaView.addSubview(detailLabel)
        backgroundBigPizzaView.addSubview(priceButton)
    }
    
    private func setupConstraints() {
        backgroundBigPizzaView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(contentView).inset(20)
            make.height.equalTo(contentView.snp.height).multipliedBy(2.0/3.0)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundBigPizzaView).inset(110)
            make.leading.equalTo(backgroundBigPizzaView).offset(20)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(backgroundBigPizzaView).offset(20)
            make.trailing.equalTo(backgroundBigPizzaView).inset(20)
        }
        
        priceButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundBigPizzaView).offset(-10)
            make.trailing.equalTo(backgroundBigPizzaView).offset(-10)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(backgroundBigPizzaView.snp.centerY)
        }
    }
}
