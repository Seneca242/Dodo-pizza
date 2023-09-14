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

//enum ButtonInsets {
//    case menu
//    case category
//}

class OvalButton: UIButton {
    init(style: PriceButtonStyle) {
        super.init(frame: .zero)
        commonInit(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(style: PriceButtonStyle) {
        var rate: CGFloat = 0
        var buttonInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        switch style {

        case .menu:
            rate = 20
            self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        case .detail:
            rate = 15
            self.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        case .cart:
            rate = 10
            self.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: rate)
//        self.setTitle("от 469 руб", for: .normal)
        self.backgroundColor = .orange.withAlphaComponent(0.1)
        self.layer.cornerRadius = 14
        self.setTitleColor(.brown, for: .normal)
        

//        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        //self.contentEdgeInsets = UIEdgeInsets(from: insets)

    }

}
