//
//  ProductImage.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit

enum ProductImageStyle {
    case menu
    case detail
    case cart
}

class ProductImageView: UIImageView {
    
    var widthMultiplier: CGFloat = 0 {
        didSet {
            updateConstraintsForWidthMultiplier()
        }
    }
    
    init(style: ProductImageStyle) {
        super.init(image: .none)
        commonInit(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(style: ProductImageStyle) {
        
        let width = UIScreen.main.bounds.width
        var rate: CGFloat = 0
       
        
        switch style {
            
        case .menu:
            rate = 0.25
        case .detail:
            rate = 0.8
        case .cart:
            rate = 0.6
        }
        
        self.heightAnchor.constraint(equalToConstant: rate * width).isActive = true
        self.widthAnchor.constraint(equalToConstant: rate * width).isActive = true
        
        self.image = UIImage(named: "default")
        self.contentMode = .scaleAspectFit
    }
    
    private func updateConstraintsForWidthMultiplier() {
        guard let superview = superview else { return }
        let width = UIScreen.main.bounds.width
        NSLayoutConstraint.deactivate(self.constraints)
        self.heightAnchor.constraint(equalToConstant: widthMultiplier * width).isActive = true
        self.widthAnchor.constraint(equalToConstant: widthMultiplier * width).isActive = true
        superview.layoutIfNeeded()
    }
}
