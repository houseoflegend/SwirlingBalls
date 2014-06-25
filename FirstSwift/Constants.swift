
//
//  Constants.swift
//  FirstSwift
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

import UIKit

// Ball count -- Reduce this value if the frame rate gets choppy
#if arch(i386) || arch(x86_64)
    // Simulator
    let BALL_COUNT: Int = 500
#else
    // Device
    let BALL_COUNT: Int = 75
#endif

// Ball size range
let MIN_BALL_RADIUS: CGFloat = 8
let MAX_BALL_RADIUS: CGFloat = 20

// Physics constants
let DAMPING: Double = 0.99
let BOUNCE_DAMPING: Double = 0.9
let ATTRACTION: Double = 0.2
let MIN_FASTNESS: CGFloat = 0.2
let MAX_FASTNESS: CGFloat = 1.0

// Appearance
let ALPHA_SCALING_DIVISOR: CGFloat = 5000 // Increase this value to reduce the opacity, and vice versa.