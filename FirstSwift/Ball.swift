//
//  Ball.swift
//  FirstSwift
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

import Foundation
import UIKit

class Ball {

    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Properties

    var radius: CGFloat
    var center: CGPoint = CGPointZero
    var velocityX: Double = 0.0
    var velocityY: Double = 0.0
    var color: UIColor
    var fastness: Double

    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Initialization
    
    init(aCenter: CGPoint, aRadius: CGFloat) {
        center = aCenter
        radius = aRadius
        color = UIColor.whiteColor()
        fastness = drand48() * MAX_FASTNESS + MIN_FASTNESS;
    }
    

    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Instance methods
    
    func update(tickTimeInterval: NSTimeInterval, touchPoint: CGPoint, bounds: CGRect) {
        // Move ball.
        var x: Double = Double(center.x) + self.velocityX * Double(tickTimeInterval)
        var y: Double = Double(center.y) + self.velocityY * Double(tickTimeInterval)
        center.x = CGFloat(x)
        center.y = CGFloat(y)
        
        // Apply ATTRACTION to mouse cursor.
        let velocityDeltaX: Double = (Double(touchPoint.x) - Double(center.x)) * Double(ATTRACTION) * Double(pow( MAX_BALL_RADIUS / Double(self.radius), 1.1)) * Double(self.fastness)
        self.velocityX = self.velocityX + velocityDeltaX
        
        let velocityDeltaY: Double = (Double(touchPoint.y) - Double(center.y)) * Double(ATTRACTION) * Double(pow( MAX_BALL_RADIUS / Double(self.radius), 1.1)) * Double(self.fastness)
        self.velocityY = self.velocityY + velocityDeltaY
        
        // Apply damping.
        self.velocityX *= DAMPING
        self.velocityY *= DAMPING

        // Apply wall bounce
        if (center.x <= self.radius || center.x >= bounds.size.width - self.radius) {
            center.x = max(center.x, self.radius + 1);
            center.x = min(center.x, bounds.size.width - self.radius - 1);
            self.velocityX = -self.velocityX * BOUNCE_DAMPING;
        }
        if (center.y <= 0.0 + self.radius || center.y >= bounds.size.height - self.radius) {
            center.y = max(center.y + 1, self.radius + 1);
            center.y = min(center.y - 1, bounds.size.height - self.radius - 1);
            self.velocityY = -self.velocityY * BOUNCE_DAMPING;
        }
    }
    
    func draw(context: CGContext) {
        var totalVelocityMagnitude: Double = pow(pow(self.velocityX, 2) + pow(self.velocityY, 2), 0.5)
        var scaledAlpha: Double = totalVelocityMagnitude / Double(ALPHA_SCALING_DIVISOR)
        var alpha: CGFloat = min(1.0, CGFloat(scaledAlpha))
        self.color = UIColor(white: 1.0, alpha: alpha)

        CGContextSetFillColorWithColor(context, color.CGColor)
        
        let ellipseRect = CGRect(x:center.x - radius, y: center.y - radius, width: radius * 2.0, height: radius * 2.0)
        CGContextFillEllipseInRect(context, ellipseRect)
    }
    
}