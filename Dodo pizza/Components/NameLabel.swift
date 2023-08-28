//
//  NameLabel.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 26.07.2023.
//

import UIKit

enum NameLabelStyle {
    case menu
    case detail
    case cart
}

class NameLabel: UILabel {
    
    init(style: NameLabelStyle) {
        super.init(frame: .zero)
        commonInit(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(style: NameLabelStyle) {
        var rate: CGFloat = 0
        
        
        switch style {
            
        case .menu:
            rate = 20
        case .detail:
            rate = 10
        case .cart:
            rate = 8
        }
        self.font = UIFont.boldSystemFont(ofSize: rate)
        self.numberOfLines = 0
    }
}
