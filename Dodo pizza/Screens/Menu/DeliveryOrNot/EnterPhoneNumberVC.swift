//
//  EnterPhoneNumberVC.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 16.09.2023.
//

import UIKit

class EnterPhoneNumberVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let closeButton = UIBarButtonItem(title: "✕", style: .plain, target: self, action: #selector(closeTapped))
        closeButton.tintColor = .orange
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
