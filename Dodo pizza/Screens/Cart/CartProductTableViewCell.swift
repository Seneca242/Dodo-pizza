//
//  CartProductTableViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 28.10.2023.
//

import UIKit

//final class CartProductTableViewCell: UITableViewCell {
//    
//    static let reuseID = "CartProductTableCell"
//    
//    lazy var stepperView = CustomStepper()
//    
//    let quantityLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
//    
//    var verticalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 15
//        stackView.alignment = .leading
//        
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 0)
//        stackView.isLayoutMarginsRelativeArrangement = true
//        return stackView
//    }()
//    
//    let nameLabel = NameLabel(style: .menu)
//    let sizeDetailLabel = SizeDetailLabel()
//    let productImageView = ProductImageView(style: .menu)
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupViews()
//        setupConstraints()
//        productImageView.widthMultiplier = 0.4
//        setupStepper()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func update(_ product: Product) {
//        nameLabel.text = product.name
//        sizeDetailLabel.text = product.sizeDetail
//        productImageView.image = UIImage(named: product.image)
//        quantityLabel.text = "\(product.quantity)"
//        stepperView.currentValue = product.quantity
//    }
//
//}
//
//extension CartProductTableViewCell {
//    
//    private func setupViews() {
//        contentView.addSubview(productImageView)
//        contentView.addSubview(verticalStackView)
//        verticalStackView.addArrangedSubview(nameLabel)
//        verticalStackView.addArrangedSubview(sizeDetailLabel)
//        
//        stepperView.currentValue = -1
//        contentView.addSubview(stepperView)
//    }
//    
//    private func setupStepper() {
//        stepperView.addTarget(self, action: #selector(stepperChangedValueAction), for: .valueChanged)
//    }
//    
//    @objc private func stepperChangedValueAction(sender: CustomStepper) {
//        print(sender)
//        print(sender.currentValue)
//    }
//    
//    private func setupConstraints() {
//        productImageView.snp.makeConstraints { make in
//            make.left.equalTo(contentView).offset(16)
//            make.centerY.equalTo(contentView)
//        }
//        verticalStackView.snp.makeConstraints { make in
//            make.top.right.bottom.equalTo(contentView).inset(16)
//            make.left.equalTo(productImageView.snp.right).offset(16)
//        }
//        stepperView.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//        }
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
//
//}

final class CartProductTableViewCell: UITableViewCell {
    
    static let reuseID = "CartProductTableCell"
    
    lazy var stepperView = CustomStepper()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 0)
//        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var upperHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    var lowerHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    let nameLabel = NameLabel(style: .menu)
    let sizeDetailLabel = SizeDetailLabel()
    let productImageView = ProductImageView(style: .menu)
    let priceLabel = PriceLabel()
    let changeButton = JustButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
//        productImageView.widthMultiplier = 0.4
        setupStepper()
        setupChangeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ product: Product) {
        nameLabel.text = product.name
        sizeDetailLabel.text = product.sizeDetail
        productImageView.image = UIImage(named: product.image)
        stepperView.currentValue = product.quantity
        priceLabel.text = String(product.price)
    }

}

extension CartProductTableViewCell {
    
    private func setupViews() {
        contentView.addSubview(upperHorizontalStackView)
        contentView.addSubview(lowerHorizontalStackView)
        contentView.addSubview(priceLabel)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(sizeDetailLabel)
        upperHorizontalStackView.addArrangedSubview(productImageView)
        upperHorizontalStackView.addArrangedSubview(verticalStackView)
        
        stepperView.currentValue = -1
//        contentView.addSubview(stepperView)
        
        
        lowerHorizontalStackView.addArrangedSubview(changeButton)
        lowerHorizontalStackView.addArrangedSubview(stepperView)
    }
    
    private func setupStepper() {
        stepperView.addTarget(self, action: #selector(stepperChangedValueAction), for: .valueChanged)
    }
    
    private func setupChangeButton() {
        changeButton.setTitle("Изменить", for: .normal)
//        changeButton.titleLabel?.textColor = .black
    }
    
    @objc private func stepperChangedValueAction(sender: CustomStepper) {
        print(sender)
        print(sender.currentValue)
    }
    
    private func setupConstraints() {
        upperHorizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.leading.equalTo(contentView).offset(16)
            make.trailing.equalTo(contentView).inset(16)
            make.height.equalTo(100)
        }
        
        lowerHorizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(upperHorizontalStackView.snp.bottom).offset(5)
            make.leading.equalTo(priceLabel).offset(150)
            make.trailing.equalTo(contentView).inset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(upperHorizontalStackView.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(16)
        }
        
        productImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
