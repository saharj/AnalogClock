//
//  DigitalClock.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/14/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit
import Snap

class DigitalViewController: UIViewController {
    
    var showTimeLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
    var showDateLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(1,
            target: self,
            selector: Selector("updateTime"),
            userInfo: nil,
            repeats: true)
        
        let viewWidth = self.view.frame.width
        
        showTimeLabel.textAlignment = NSTextAlignment.Center
        showTimeLabel.textColor = UIColor.blackColor()
        showTimeLabel.font = UIFont(name: "Let's go Digital", size: 120.0)

        showDateLabel.textAlignment = NSTextAlignment.Center
        showDateLabel.textColor = UIColor.blackColor()

        updateTime()
        updateDate()
        
        self.view.addSubview(showTimeLabel)
        self.view.addSubview(showDateLabel)
        
        //adding constraints
        showTimeLabel.snp_makeConstraints { make in
            make.center.equalTo(self.view.snp_center)
            return
        }
        showDateLabel.snp_makeConstraints { make in
            make.top.equalTo(self.showTimeLabel.snp_bottom).offset(10)
            make.centerX.equalTo(self.showTimeLabel.snp_centerX)
            return
        }
    }

    func updateTime() {
        var time = NSDate()
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .MediumStyle
        
        var timeElements = timeFormatter.stringFromDate(NSDate()).stringByReplacingOccurrencesOfString(" PM", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil).stringByReplacingOccurrencesOfString(" AM", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        showTimeLabel.text = timeElements
        showTimeLabel.sizeToFit()
    }
    
    func updateDate() {
        var date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .FullStyle
        
        var dateElements = dateFormatter.stringFromDate(NSDate()).componentsSeparatedByString(" ")
        
        //day of the week
        var firstElem = dateElements[0].componentsSeparatedByString(",")
        var week = firstElem[0]
        
        //date
        var thirdElem = dateElements[2].componentsSeparatedByString(",")
        var dateOfYear : String = dateElements[1] + " " + thirdElem[0]
        
        showDateLabel.text = week + ", " + dateOfYear
        showDateLabel.sizeToFit()
    }

}
