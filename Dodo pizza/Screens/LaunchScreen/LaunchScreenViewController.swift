//
//  LaunchScreenViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 08.08.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    private func setupViews() {
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(imageView)
    }
}
