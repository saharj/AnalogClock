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
        
        
        tabBarItem.title = "Analog"
        //tabBarItem.image = UIImage(named: "analog-clock-icon")
        
        imageView?.image = UIImage(named: "aClock")
        
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1,
            target: self,
            selector: Selector("setTime:"),
            userInfo: nil,
            repeats: true)
        
        setTime(timer)
        
    }
    
    
    func setTime(timer : NSTimer) {
        var date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .MediumStyle
        
        var elements = dateFormatter.stringFromDate(NSDate()).componentsSeparatedByString(":")
        
        var hour = elements[0].toInt()
        var min = elements[1].toInt()
        var lastElem = elements[2].componentsSeparatedByString(" ")
        var sec = lastElem[0].toInt()
        
        
        dispatch_async(dispatch_get_main_queue()) {
            self.setHands(hour!, m: min!, s: sec!)
        }
        
    }
    
    func setHands(h : Int, m : Int, s : Int) {
        clockView?.clearsContextBeforeDrawing
        clockView?.time.hour = h
        clockView?.time.min = m
        clockView?.time.sec = s
        
        clockView?.setNeedsDisplay()
    }
    
}

