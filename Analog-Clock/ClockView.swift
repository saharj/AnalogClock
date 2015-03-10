//
//  ClockView.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/6/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    
    // make a function to update the time (viewController will use it)
    
    
    let HOUR_HAND_SIZE = CGSize(width: 12, height: 90)
    let MIN_HAND_SIZE = CGSize(width: 8, height: 130)
    let SEC_HAND_SIZE = CGSize(width: 4, height: 150)
    
    var hour : Int = 11
    var min : Int = 55
    var sec : Int = 45
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()    //BG color of the hands layer
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        drawHourHand(rect)
        drawMinHand(rect)
        drawSecHand(rect)
    }
    
    // define size of hands
    func drawHourHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let x = (rect.size.width / 2) - (HOUR_HAND_SIZE.width / 2)
        let y = (rect.size.width / 2) - HOUR_HAND_SIZE.height
        
        rotate(context, rect: rect, deg: hour * 30)
        
        CGContextFillRect(context, CGRect(x: x, y: y, width: HOUR_HAND_SIZE.width, height: HOUR_HAND_SIZE.height))
        
    }
    
    func drawMinHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let x = (rect.size.width / 2) - (MIN_HAND_SIZE.width / 2)
        let y = (rect.size.width / 2) - MIN_HAND_SIZE.height
        
        rotate(context, rect: rect, deg: min * 6 - hour * 30)
        
        CGContextFillRect(context, CGRect(x: x, y: y, width: MIN_HAND_SIZE.width, height: MIN_HAND_SIZE.height))
    }
    
    func drawSecHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let x = (rect.size.width / 2) - (SEC_HAND_SIZE.width / 2)
        // make the sec-hand to overflow
        let y = (rect.size.width / 2) - (SEC_HAND_SIZE.height) + 20
        CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0)
        
        rotate(context, rect: rect, deg: sec * 6 - min * 6)
        
        CGContextFillRect(context, CGRect(x: x, y: y, width: SEC_HAND_SIZE.width, height: SEC_HAND_SIZE.height))
    }
    
    func degreeToRadian(deg : Int) -> CGFloat {
        return (CGFloat(deg) * CGFloat(M_PI)) / CGFloat(180)
    }
    
    func rotate(context : CGContext, rect : CGRect, deg : Int) {
        
        CGContextTranslateCTM(context, rect.size.width / 2, rect.size.width / 2)
        CGContextRotateCTM(context, degreeToRadian(deg))
        CGContextTranslateCTM(context, rect.size.width / -2, rect.size.width / -2)
        
    }
    
}
