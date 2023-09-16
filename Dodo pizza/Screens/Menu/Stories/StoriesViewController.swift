//
//  StoriesViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 15.09.2023.
//

import UIKit

class StoriesViewController: UIViewController {
    
    private let storiesService = StoriesService()
    private var stories: [Stories] = []
    
    private var currentIndex = 0
    private let imageView = UIImageView()
    private var progressBarViews: [ProgressBarView] = []
    private var progressTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        stories = storiesService.fetchBanners()
        loadImage()
        
        startProgressTimer()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        view.addSubview(imageView)
        
        let progressBarHeight: CGFloat = 2.0
        let progressBarSpacing: CGFloat = 5.0
        let progressBarWidth = (view.bounds.width - CGFloat(stories.count - 1) * progressBarSpacing) / CGFloat(stories.count)
        
        for index in 0..<stories.count {
            let xPosition = CGFloat(index) * (progressBarWidth + progressBarSpacing)
            let progressBarView = ProgressBarView(frame: CGRect(x: xPosition, y: 20, width: progressBarWidth, height: progressBarHeight))
            progressBarViews.append(progressBarView)
            view.addSubview(progressBarView)
        }
    }
    
    private func loadImage() {
        guard currentIndex < stories.count else {
            dismiss(animated: true)
            return
        }
        let story = stories[currentIndex]
        imageView.image = UIImage(named: story.image)
    }
    
    private func startProgressTimer() {
        progressTimer?.invalidate()
        progressBarViews[currentIndex].setProgress(0.0)
        
        var timeInterval: TimeInterval = 0
        
        progressTimer = Timer.scheduledTimer(
            withTimeInterval: 0.1,
            repeats: true,
            block: { [weak self] (timer) in
                guard let self = self else { return }
                
                timeInterval += 0.1
                let progress = CGFloat(timeInterval) / 15.0
                
                self.progressBarViews[self.currentIndex].setProgress(progress)
                
                if timeInterval >= 15 {
                    self.currentIndex += 1
                    self.loadImage()
                    self.startProgressTimer()
                }
            }
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        progressTimer?.invalidate()
    }
}
