//
//  JustButton.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 31.10.2023.
//

import UIKit

class JustButton: UIButton {
    
    init(style: CGRect = .zero) {
        super.init(frame: style)
        commonInit()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.backgroundColor = .clear
        self.setTitleColor(.orange, for: .normal)
    }
}
