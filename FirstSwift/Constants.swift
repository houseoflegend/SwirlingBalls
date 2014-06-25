
//
//  Constants.swift
//  FirstSwift
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

// Ball count -- Reduce this value if the frame rate gets choppy
#if arch(i386) || arch(x86_64)
    // Simulator
    let BALL_COUNT: Double = 500
#else
    // Device
    let BALL_COUNT: Double = 75
#endif

// Ball size range
let MIN_BALL_RADIUS: Double = 8
let MAX_BALL_RADIUS: Double = 20

// Physics constants
let DAMPING: Double = 0.99
let BOUNCE_DAMPING: Double = 0.9
let ATTRACTION: Double = 0.2
let MIN_FASTNESS: Double = 0.2
let MAX_FASTNESS: Double = 1.0

// Appearance
let ALPHA_SCALING_DIVISOR: Double = 5000 // Increase this value to reduce the opacity, and vice versa.