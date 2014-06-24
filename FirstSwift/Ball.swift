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
    var velocityX: CGFloat = 0.0
    var velocityY: CGFloat = 0.0
    var color: UIColor = UIColor.whiteColor()
    var fastness: CGFloat = 10.0

    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Initialization
    
    init(aRadius: CGFloat) {
        radius = aRadius
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Instance methods
    
    func update(tickTime: NSDate, touchPoint: CGPoint, bounds: CGRect) {
        center.x = center.x + 1
        center.y = center.y + 1
        if center.x > bounds.size.width {
            center.x = 0.0;
            center.y = 0.0;
        }
    }
    
    func draw(context: CGContext) {
        CGContextSetFillColorWithColor(context, color.CGColor)
        
        let ellipseRect = CGRect(x:center.x - radius, y: center.y - radius, width: radius * 2.0, height: radius * 2.0)
        CGContextFillEllipseInRect(context, ellipseRect)
    }
    
}