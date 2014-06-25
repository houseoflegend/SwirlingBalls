//
//  AnimationLayer.swift
//  SwirlingBalls
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
    
    var currentTouchPoint: CGPoint = CGPointZero
    var previousDate = NSDate()
    var balls: Ball[] = []
    
    
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
        var centerPointOfLayer = CGPoint(x: self.bounds.size.width, y: self.bounds.size.height)
        self.currentTouchPoint = centerPointOfLayer
        
        for i in 0..BALL_COUNT {
            let randomRadius = MIN_BALL_RADIUS + CGFloat(drand48()) * (MAX_BALL_RADIUS - MIN_BALL_RADIUS)
            let ball = Ball(aCenter: centerPointOfLayer, aRadius: randomRadius)
            balls.append(ball)
        }
    }
    
    func update() {
        var newDate = NSDate()
        var tickTimeInterval = newDate.timeIntervalSinceDate(previousDate)
        previousDate = newDate
        
        for i in 0..BALL_COUNT {
            let ball = balls[Int(i)]
            
            var constrainedTouchPointX = CGFloat(min(max(MAX_BALL_RADIUS + 1, CGFloat(self.currentTouchPoint.x)), CGFloat(self.bounds.size.width) - MAX_BALL_RADIUS - 1))
            var constraintedTouchPointY = CGFloat(min(max(MAX_BALL_RADIUS + 1, CGFloat(self.currentTouchPoint.y)), CGFloat(self.bounds.size.height) - MAX_BALL_RADIUS - 1))
            
            var constrainedTouchPoint = CGPoint(x: constrainedTouchPointX, y: constraintedTouchPointY)
            
            ball.update(tickTimeInterval, touchPoint: constrainedTouchPoint, bounds: self.bounds)
        }
    }
    
    func draw(context: CGContext) {
        drawBackground(context)
        
        for i in 0..BALL_COUNT {
            let ball = balls[Int(i)]
            ball.draw(context)
        }
    }
    
    func drawBackground(context: CGContext) {
        let backgroundColor = UIColor(white:0.1, alpha: 1.0)
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor)
        CGContextFillRect(context, CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
    }
    
}



//    func drawBackground(context: CGContext) {
//        let gradient = CGGradientCreateWithColors(<#space: CGColorSpace?#>, <#colors: CFArray?#>, <#locations: CConstPointer<CGFloat>#>)
//        let center = CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
//        let startRadius = 0.0
////        let endRadius = MIN(self.frame.size.width / 2.0, self.frame.size.height / 2.0)
//        let endRadius = { () -> CGFloat in
//            if self.frame.size.width / 2.0 < self.frame.size.height / 2.0 {
//                return self.frame.size.width / 2.0
//            }
//            else {
//                return self.frame.size.height / 2.0
//            }
//        }
//        CGContextDrawRadialGradient(context, gradient: gradient, startRadius: startRadius, endCenter: center, endRadius: endRadius, options: 0)
////
//    }
//
////    func CGGradientCreateWithColors(space: CGColorSpace!, colors: CFArray!, locations: CConstPointer<CGFloat>) -> CGGradient!
//
//    func createGradient(startColor: CGColorRef, endColor: CGColorRef) -> CGGradientRef {
//        let colorSpace = CGColorSpaceCreateDeviceRGB();
//        let colors = CFArrayCreate(<#allocator: CFAllocator?#>, <#values: CMutablePointer<COpaquePointer>#>, <#numValues: CFIndex#>, <#callBacks: CConstPointer<CFArrayCallBacks>#>)
//        CGFloat locations[] = { 0.0, 1.0 };
//
//        NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
//
//        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
//
//    }
