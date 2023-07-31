//
//  NameLabel.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 26.07.2023.
//

import UIKit

class NameLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
