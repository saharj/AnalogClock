//
//  DigitalClock.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/14/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit

class DigitalViewController: UIViewController {
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tabBarItem.image = UIImage(named: "analog-clock-item")
        
        var label = UILabel(frame: CGRectMake(0, 0, 200, 21))
        
        
        
        let viewWidth = self.view.frame.width
        //let viewHeight = self.view.frame.height
        
        label.center = CGPointMake(viewWidth / 2 , 284)
        label.textAlignment = NSTextAlignment.Center
        label.text = "15:25:22"
        //label.font = UIFont (name: "digital-font", size: CGFloat(30))
        
        label.textColor = UIColor.blackColor()
        
        self.view.addSubview(label)
        
        
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
