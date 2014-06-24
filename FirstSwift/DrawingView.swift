//
//  DrawingView.swift
//  FirstSwift
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

import Foundation
import UIKit

class DrawingView: UIView {
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Initialization
    
    init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Setup
    
    func setup() {
        setupAnimationLayer()
    }
    
    func setupAnimationLayer() {
        let animationLayer = AnimationLayer()
        animationLayer.bounds = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        animationLayer.anchorPoint = CGPointZero
        
        self.layer.addSublayer(animationLayer)
    }
    
}
