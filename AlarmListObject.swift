//
//  AlarmListObject.swift
//  AlarmList
//
//  Created by Lixin Sui on 3/13/15.
//  Copyright (c) 2015 De Anza. All rights reserved.
//

import UIKit
import CoreData

class AlarmListObject: NSManagedObject {
    @NSManaged var alarmName : String!
    @NSManaged var alarmTime : String!
    @NSManaged var alarmDate : NSDate!
    @NSManaged var alarmSwitch : NSNumber!
}
