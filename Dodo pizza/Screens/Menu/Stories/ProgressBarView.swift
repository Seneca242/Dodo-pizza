//
//  ProgressBarView.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 15.09.2023.
//

import UIKit

class ProgressBarView: UIView {
    
    private let progressLayer = CAShapeLayer()
    private let backgroundMask = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundMask.frame = self.bounds
        backgroundMask.fillColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(backgroundMask)
        
        progressLayer.frame = self.bounds
        progressLayer.fillColor = UIColor.white.cgColor
        self.layer.addSublayer(progressLayer)
    }
    
    func setProgress(_ progress: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.bounds.height / 2))
        path.addLine(to: CGPoint(x: self.bounds.width * progress, y: self.bounds.height / 2))
        progressLayer.path = path.cgPath
    }
}
