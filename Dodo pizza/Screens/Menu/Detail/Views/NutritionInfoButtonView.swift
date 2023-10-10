//
//  NutritionInfoButtonView.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 25.09.2023.
//

//import UIKit
//import SnapKit
//
//class NutritionInfoButtonView: UIView {
//    
//    let nutritionInfoButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("i", for: .normal)
//        button.backgroundColor = .white
//        button.setTitleColor(.gray, for: .normal)
//        button.layer.cornerRadius = 15
//        button.layer.borderWidth = 5
//        button.layer.borderColor = UIColor.gray.cgColor
//        return button
//    }()
//    
//    let nutritionInfoView = NutritionInfoView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setupViews()
//        setupConstraints()
//        
//        nutritionInfoButton.addTarget(
//            self,
//            action: #selector(showNutritionInfoView),
//            for: .touchUpInside
//        )
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupViews() {
//
//        self.addSubview(nutritionInfoButton)
//        self.addSubview(nutritionInfoView)
//    }
//    
//    private func setupConstraints() {
//        nutritionInfoButton.snp.makeConstraints { make in
//            make.width.equalToSuperview().inset(10)
//            make.height.equalTo(40)
//            make.centerX.equalTo(self)
//            make.top.equalToSuperview().offset(16)
//        }
//    }
//    
//}
//
//
////MARK: - Event Handler (Actions)
//extension NutritionInfoButtonView {
//    @objc private func showNutritionInfoView() {
//        nutritionInfoView.nutritionInfoView.isHidden.toggle()
//        print("tapped")
//    }
//}
