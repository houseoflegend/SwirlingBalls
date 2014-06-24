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
    var aBall = Ball.init(aRadius: 10.0)
    
    
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
        let point = CGPoint(x: 0, y: 0)
        let date = NSDate()
        aBall.update(date, touchPoint: point, bounds: self.bounds)
        
        println("\(__FUNCTION__) x: \(lastPoint.x), x: \(lastPoint.y)")
    }
    
    func draw(context: CGContext) {
        drawBackground(context)
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, lastPoint.x, lastPoint.y);
        CGContextStrokePath(context);
        
        aBall.draw(context)
    }
    
    func drawBackground(context: CGContext) {
        CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
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
