//
//  ProductImage.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit

class ProductImageView: UIImageView {
    
    init() {
        super.init(image: .none)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.image = UIImage(named: "default")
        self.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        self.heightAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
        self.widthAnchor.constraint(equalToConstant: 0.40 * width).isActive = true
    }
}
