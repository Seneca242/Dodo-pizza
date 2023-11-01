//
//  OrderPriceButton.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 02.08.2023.
//

import UIKit
import SnapKit

class OrderButtonView: UIView {
    
    var orderCount: Int = 0
    var onOrderButtonTapped: ((Int) -> ())?

    
    var orderButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 20
        button.isUserInteractionEnabled = true
        
        button.setBackgroundImage(
            UIImage(
                color:
                    UIColor(
                        red: 237/255,
                        green: 118/255,
                        blue: 0/255,
                        alpha: 1
                    )
            ),
            for: .normal
        )
        
        button.setBackgroundImage(
            UIImage(
                color:
                    UIColor(
                        red: 237/255,
                        green: 118/255,
                        blue: 0/255,
                        alpha: 0.5
                    )
            ),
            for: .highlighted
        )
        button.layer.masksToBounds = true
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        orderButton.addTarget(self, action: #selector(handleOrderButtonTap), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleOrderButtonTap() {
        orderCount += 1
        onOrderButtonTapped?(orderCount)
    }
    
    private func setupViews() {
        self.addSubview(orderButton)
    }
    
    private func setupConstraints() {
        orderButton.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(10)
            make.height.equalTo(40)
            make.centerX.equalTo(self)
            make.top.equalToSuperview().offset(16)
        }
    }
    
}

public extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
