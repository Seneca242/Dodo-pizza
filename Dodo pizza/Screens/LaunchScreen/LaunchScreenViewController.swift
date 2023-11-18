//
//  LaunchScreenViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 08.08.2023.
//

import UIKit

//class LaunchScreenViewController: UIViewController {
//
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "launchScreen")
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//        setupConstraints()
//    }
//    
//    private func setupViews() {
//        view.addSubview(imageView)
//    }
//    
//    private func setupConstraints() {
//        imageView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        playExtendedHapticFeedback()
//    }
//    
//    private func playExtendedHapticFeedback() {
//        let feedbackGenerator = UINotificationFeedbackGenerator()
//        
//        feedbackGenerator.prepare()
//        feedbackGenerator.notificationOccurred(.success)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
//            feedbackGenerator.notificationOccurred(.success)
//        }
//    }
//}

import AudioToolbox

class LaunchScreenViewController: UIViewController {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        
        let when = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: when) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
}
