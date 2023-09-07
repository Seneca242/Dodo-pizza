//
//  LaunchScreenViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 08.08.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//    }
//
//
//    private func setupViews() {
//        let imageView = UIImageView(frame: view.bounds)
//        imageView.image = UIImage(named: "launchScreen")
//        imageView.contentMode = .scaleAspectFill
//        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(imageView)
//    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "launchScreen")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(imageView)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
