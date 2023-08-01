//
//  ProductImage.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit

class ProductImageView: UIImageView {
    
    var widthMultiplier: CGFloat = 0 {
        didSet {
            updateConstraintsForWidthMultiplier()
        }
    }
    
    init() {
        super.init(image: .none)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.image = UIImage(named: "default")
        self.contentMode = .scaleAspectFit
//        let width = UIScreen.main.bounds.width
//        self.heightAnchor.constraint(equalToConstant: widthMultiplier * width).isActive = true
//        self.widthAnchor.constraint(equalToConstant: widthMultiplier * width).isActive = true
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
