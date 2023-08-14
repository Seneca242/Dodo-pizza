//
//  PriceButton.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit

enum PriceButtonStyle {
    case menu
    case detail
    case cart
}

class PriceButton: UIButton {
    init(style: PriceButtonStyle) {
        super.init(frame: .zero)
        commonInit(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(style: PriceButtonStyle) {
        var rate: CGFloat = 0
        
        
        switch style {
            
        case .menu:
            rate = 20
        case .detail:
            rate = 10
        case .cart:
            rate = 8
        }
        self.titleLabel?.font = UIFont.systemFont(ofSize: rate)
//        self.setTitle("от 469 руб", for: .normal)
        self.backgroundColor = .orange.withAlphaComponent(0.1)
        self.layer.cornerRadius = 20
        self.setTitleColor(.brown, for: .normal)
        
//        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        var config = self.configuration ?? UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        self.configuration = config
    }
}
