//
//  DetailLabel.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit

class DetailLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.text = "Тесто, Цыпленок, моцарелла, томатный соус"
        self.textColor = .darkGray
        self.numberOfLines = 0
        self.font = UIFont.boldSystemFont(ofSize: 15)
    }
}
