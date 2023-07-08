//
//  ProductCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 04.07.2023.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    static let reuseID = "ProductCell"
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Пепперони"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Тесто, Цыпленок, моцарелла, томатный соус"
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var priceButton: UIButton = {
        let button = UIButton()
        button.setTitle("от 469 руб", for: .normal)
        button.backgroundColor = .orange.withAlphaComponent(0.1) // сделать более прозрачно
        button.layer.cornerRadius = 20
        button.setTitleColor(.brown, for: .normal)
//        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        return button
    }()
    
//    private var priceButton: UIButton = {
//        let configuration = UIButtonConfiguration.plain()
//        configuration.title = "от 469 руб"
//        configuration.baseBackgroundColor = .orange.withAlphaComponent(0.1)
//        configuration.cornerRadius = 20
//        configuration.baseForegroundColor = .brown
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
//
//        let button = UIButton(configuration: configuration)
//        return button
//    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        imageView.heightAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        return imageView
    }()

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
        priceButton.setTitle("\(product.price) р", for: .normal)
        productImageView.image = UIImage(named: product.image)
    }
}

extension ProductCell {
    
    private func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLabel) // упорядоченную стаквью
        verticalStackView.addArrangedSubview(detailLabel)
        verticalStackView.addArrangedSubview(priceButton)
    }
    
    private func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(productImageView.snp.right).offset(16)
        }
    }
}
