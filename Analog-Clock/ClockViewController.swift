//
//  ClockViewController.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 2/24/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit
import QuartzCore
import Foundation

class ClockViewController: UIViewController {

    var imageView : UIImageView?
    var clockView : ClockView?
    
    override func loadView() {
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.whiteColor()
        
        let mainBounds = UIScreen.mainScreen().bounds
        let MARGIN = CGFloat(20.0)
        let x = mainBounds.origin.x + MARGIN
        let y = (mainBounds.size.height / 2) - (mainBounds.size.width / 2) + MARGIN
        let width = mainBounds.size.width - MARGIN * 2
        
        var clockFrame = CGRect(x: x, y: y, width: width, height: width)
        
        imageView = UIImageView(frame: clockFrame)
        clockView = ClockView(frame: clockFrame)
        
        
        view.addSubview(imageView!)
        view.addSubview(clockView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView?.image = UIImage(named: "aClock")
    }
    
}

