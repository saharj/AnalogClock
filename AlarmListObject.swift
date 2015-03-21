//
//  AlarmListObject.swift
//  AlarmList
//
//  Created by Lixin Sui on 3/13/15.
//  Copyright (c) 2015 De Anza. All rights reserved.
//

import UIKit
import CoreData

@objc(AlarmListObject)
class AlarmListObject: NSManagedObject {
    @NSManaged var alarmName : NSString!
    @NSManaged var alarmTime : NSString!
    @NSManaged var alarmDate : NSDate!
    @NSManaged var alarmSwitch : NSNumber!
}
