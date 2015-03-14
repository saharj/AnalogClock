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
        self.view = UIView()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        var label = UILabel()
        label.text = "Hello!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "Digital"
        //tabBarItem.image = UIImage(named: "analog-clock-item")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
