//
//  NutritionInfoButtonView.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 24.09.2023.
//

import UIKit

class NutritionInfoView: UIView {
    
    let nutritionInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    let nutritionInfoButton: UIButton = {
        let button = UIButton()
        button.setTitle("i", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .white
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.gray.cgColor
        return button
    }()
    
    let bannerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let nutritionalTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "Пищевая ценность на 100 г"
        return label
    }()
    
    let energyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let proteinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let fatLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let carbohydratesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setupConstraints()
        nutritionInfoButton.addTarget(
            self,
            action: #selector(showNutritionInfoView),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(nutritionInfoView)
        addSubview(nutritionInfoButton)
        
        nutritionInfoView.addSubview(bannerNameLabel)
        nutritionInfoView.addSubview(nutritionalTitleLabel)
        nutritionInfoView.addSubview(energyLabel)
        nutritionInfoView.addSubview(proteinLabel)
        nutritionInfoView.addSubview(fatLabel)
        nutritionInfoView.addSubview(carbohydratesLabel)
        nutritionInfoView.addSubview(weightLabel)
        
        
    }
    
    private func setupConstraints() {
        nutritionInfoButton.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        nutritionInfoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        
        bannerNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        
        nutritionalTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bannerNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        energyLabel.snp.makeConstraints { make in
            make.top.equalTo(nutritionalTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
        }
        
        proteinLabel.snp.makeConstraints { make in
            make.top.equalTo(energyLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
        }
        
        fatLabel.snp.makeConstraints { make in
            make.top.equalTo(proteinLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
        }
        
        carbohydratesLabel.snp.makeConstraints { make in
            make.top.equalTo(fatLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(carbohydratesLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
        }
    }
    
    func updateInfoView(with banner: Banner) {
        guard let nutritionalValues = banner.nutritionalValues else { return }
        
        bannerNameLabel.text = banner.name
        energyLabel.text = "Пищевая ценность    \(nutritionalValues.energy)"
        proteinLabel.text = "Белки                                 \(nutritionalValues.protein)"
        fatLabel.text = "Жиры                                 \(nutritionalValues.fat)"
        carbohydratesLabel.text = "Углеводы                         \(nutritionalValues.carbohydrates)"
        weightLabel.text = "Вес                                      \(nutritionalValues.weight)"
    }
    
}

//MARK: - Event Handler (Actions)
extension NutritionInfoView {
    @objc private func showNutritionInfoView() {
        self.nutritionInfoView.isHidden.toggle()
    }
}
