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
        button.backgroundColor = .red
        button.setTitle("300 р", for: .normal)
        button.layer.cornerRadius = 8
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
            make.width.equalTo(50)
            make.height.equalTo(20)
            make.top.bottom.leading.trailing.equalTo(self).inset(16)
        }
    }
    
}
