//
//  ClockView.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/6/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    //TODO: define size of other hands
    //TODO: calc rotation degree of each hand
    // rotate the context based on above
    // make a function to update the time (viewController will use it)
    
    
    let HOUR_HAND_SIZE = CGSize(width: 10, height: 90)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        drawHourHand(rect)
        drawMinHand(rect)
        drawSecHand(rect)
    }

    func drawHourHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let x = (rect.size.width / 2) - (HOUR_HAND_SIZE.width / 2)
        let y = (rect.size.width / 2) - HOUR_HAND_SIZE.height
        CGContextFillRect(context, CGRect(x: x, y: y, width: HOUR_HAND_SIZE.width, height: HOUR_HAND_SIZE.height))
    }
    
    func drawMinHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        //TODO
    }
    
    func drawSecHand(rect : CGRect) {
        let context = UIGraphicsGetCurrentContext()
        //TODO
    }
}
