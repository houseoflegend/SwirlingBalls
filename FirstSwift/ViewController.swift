//
//  ViewController.swift
//  FirstSwift
//
//  Created by Larry Legend on 6/24/14.
//  Copyright (c) 2014 House of Legend. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Initialization

    override func awakeFromNib() {
        setup()
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////
    // MARK: Setup
    
    func setup() {
        setupMainDrawingView()
    }
    
    func setupMainDrawingView() {
        let drawingView = DrawingView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.addSubview(drawingView)
    }
    
}

