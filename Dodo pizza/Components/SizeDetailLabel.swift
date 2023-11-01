//
//  SizeDetailLabel.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 30.10.2023.
//

import UIKit

class SizeDetailLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.text = ""
        self.textColor = .gray
        self.numberOfLines = 0
        self.font = UIFont(name: "Arial", size: 15)
    }
}

