//
//  AnimationLayer.swift
//  FirstSwift
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class AnimationLayer: CALayer {
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Properties
    
    var lastPoint = CGPointZero
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Initialization
    
    init() {
        super.init()
        
        setup()
        
        var displayLink = CADisplayLink(target: self, selector: "updateAndDraw")
        displayLink.frameInterval = 1
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        setNeedsDisplay() // This will call drawInContext:
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: CADisplayLink selector hook

    func updateAndDraw() {
        update()
        setNeedsDisplay() // This will trigger calling drawInContext:
    }

    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: drawInContext override
    
    override func drawInContext(context: CGContext) {
        super.drawInContext(context)
        
        draw(context)
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: setup/update/draw methods
    
    func setup() {
        
    }
    
    func update() {
        lastPoint.x = lastPoint.x + 1
        lastPoint.y = lastPoint.y + 1
        if lastPoint.x > self.frame.size.width {
            lastPoint.x = 0.0;
            lastPoint.y = 0.0;
        }

        println("x: \(lastPoint.x), x: \(lastPoint.y)")
    }
    
    func draw(context: CGContext) {
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y);
        CGContextStrokePath(context);
        
        let ellipseRect = CGRect(x:lastPoint.x, y:lastPoint.y, width: 50, height: 50)
        CGContextFillEllipseInRect(context, ellipseRect)
    }
    
}
