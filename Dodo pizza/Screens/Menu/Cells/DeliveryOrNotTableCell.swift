//
//  SegmentedControlTableCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 16.09.2023.
//

import UIKit

class DeliveryOrNotTableCell: UITableViewCell {
    
    static let reuseID = "DeliveryOrNotTableCell"
    
    let segmentedControl: UISegmentedControl = {
        let items = ["На доставку", "В пиццерии"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        
        control.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.black,
                .font: UIFont.boldSystemFont(ofSize: 14)
            ],
            for: .selected
        )
        
        control.setTitleTextAttributes(
            [
                .foregroundColor: UIColor.darkGray,
                .font: UIFont.systemFont(ofSize: 14)
            ],
            for: .normal
        )
        
        control.selectedSegmentTintColor = .white
        control.backgroundColor = UIColor(
            red: 208/255,
            green: 208/255,
            blue: 208/255,
            alpha: 1
        )
        
        return control
    }()
    
    let deliveryAddressButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Указать адрес доставки >", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.contentHorizontalAlignment = .center // Этот код выравнивает текст по центру кнопки
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let separatorView = UIView()
        separatorView.backgroundColor = .darkGray
        
        let stackView = UIStackView(arrangedSubviews: [segmentedControl, separatorView, deliveryAddressButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
