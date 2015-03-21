//
//  ClockView.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/6/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit

struct Time {
    var hour : Int = 0
    var min : Int = 0
    var sec : Int = 0
}

class ClockView: UIView {
    
    // make a function to update the time (viewController will use it)

    var time : Time = Time() {
        didSet {}
    }
    
    let HOUR_HAND_SIZE = CGSize(width: 12, height: 90)
    let MIN_HAND_SIZE = CGSize(width: 8, height: 130)
    let SEC_HAND_SIZE = CGSize(width: 4, height: 150)
    
    
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
        
        rotate(context, rect: rect, deg: (time.hour * 30) + (time.min * 1/2))
        
        CGContextFillRect(context, CGRect(x: x, y: y, width: HOUR_HAND_SIZE.width, height: HOUR_HAND_SIZE.height))
        
        //var path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: (HOUR_HAND_SIZE.width) / 2, height: (HOUR_HAND_SIZE.height) / 2))
        //path.addClip()
    }
    
    func drawMinHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let x = (rect.size.width / 2) - (MIN_HAND_SIZE.width / 2)
        let y = (rect.size.width / 2) - MIN_HAND_SIZE.height
        
        rotate(context, rect: rect, deg: time.min * 6 - time.hour * 30) // to avoid the problem of add to prev angel
        
        CGContextFillRect(context, CGRect(x: x, y: y, width: MIN_HAND_SIZE.width, height: MIN_HAND_SIZE.height))
    }
    
    func drawSecHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let x = (rect.size.width / 2) - (SEC_HAND_SIZE.width / 2)
        // make the sec-hand to overflow
        let y = (rect.size.width / 2) - (SEC_HAND_SIZE.height) + 20
        CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0)
        
        rotate(context, rect: rect, deg: time.sec * 6 - time.min * 6)
        
        CGContextFillRect(context, CGRect(x: x, y: y, width: SEC_HAND_SIZE.width, height: SEC_HAND_SIZE.height))
        
        //var path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 4.0/*SEC_HAND_SIZE.width*/, height: 4.0/*SEC_HAND_SIZE.height*/))
        //path.addClip()
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
