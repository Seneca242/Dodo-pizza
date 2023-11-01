//
//  PriceLabel.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 28.10.2023.
//

import UIKit

class PriceLabel: UILabel {

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commintInit(_ product: Product) {
        self.text = "\(product.price) ₽"
    }
    
}
