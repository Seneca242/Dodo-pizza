//
//  OrderPriceButton.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 02.08.2023.
//

import UIKit
import SnapKit

class OrderButtonView: UIView {
    
    var orderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
//        button.setTitle("В корзину за 300 ₽", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(orderButton)
    }
    
    private func setupConstraints() {
        orderButton.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalToSuperview().offset(16)
        }
    }
    
}
