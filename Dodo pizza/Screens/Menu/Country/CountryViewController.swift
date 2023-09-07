//
//  CountryViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 28.08.2023.
//

import UIKit

class CountryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCancelButton()
    }
    
    private func setupCancelButton() {
        let cancelButton = UIBarButtonItem(
            title: "Отменить",
            style: .plain,
            target: self,
            action: #selector(cancelButtonTapped)
        )
        
        cancelButton.tintColor = UIColor(
            red: 210/255,
            green: 105/255,
            blue: 30/255,
            alpha: 1
        )
        
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
