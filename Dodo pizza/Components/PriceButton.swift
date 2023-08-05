//
//  PriceButton.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.07.2023.
//

import UIKit

class PriceButton: UIButton {
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
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
