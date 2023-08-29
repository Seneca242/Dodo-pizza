//
//  CityViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 28.08.2023.
//

import UIKit

class CityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCountryButton()
    }
    
    private func setupCountryButton() {
        var configuration = UIButton.Configuration.plain()
        configuration.imagePadding = 5
//        configuration.titlePadding = 15
        
        let countryButtonImage = UIImage(systemName: "chevron.left")?.withTintColor(
            UIColor(
                red: 210/255,
                green: 105/255,
                blue: 30/255,
                alpha: 1
            ),
            renderingMode: .alwaysOriginal
        )
        
        configuration.image = countryButtonImage
        configuration.title = "Страны"
        
        let countryButton = UIButton(configuration: configuration)
        countryButton.tintColor = UIColor(
            red: 210/255,
            green: 105/255,
            blue: 30/255,
            alpha: 1
        )
        countryButton.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        countryButton.semanticContentAttribute = .forceLeftToRight
        
        countryButton.addTarget(
            self,
            action: #selector(chooseCountry),
            for: .touchUpInside
        )
        
        let countryBarButtonItem = UIBarButtonItem(customView: countryButton)
        navigationItem.leftBarButtonItem = countryBarButtonItem
    }
    
    @objc private func chooseCountry() {
        let countryVC = CountryViewController()
        let navigationController = UINavigationController(rootViewController: countryVC)
        self.navigationController?.pushViewController(countryVC, animated: true)
    }
    
}
