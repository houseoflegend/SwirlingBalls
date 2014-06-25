//
//  DrawingView.swift
//  SwirlingBalls
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

import Foundation
import UIKit

class DrawingView: UIView {
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Properties

    var animationLayer: AnimationLayer = AnimationLayer()
    
    
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
        self.animationLayer.bounds = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.animationLayer.anchorPoint = CGPointZero
        
        self.layer.addSublayer(animationLayer)
    }
    
}

extension DrawingView {
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        let touch = touches.anyObject() as UITouch
        self.animationLayer.currentTouchPoint = touch.locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!)  {
        let touch = touches.anyObject() as UITouch
        self.animationLayer.currentTouchPoint = touch.locationInView(self)
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {

    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!)  {
        
    }
    
}
