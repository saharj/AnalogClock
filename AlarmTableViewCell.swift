//
//  AlarmTableViewCell.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/21/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

//    @IBOutlet var cellAlarmTime: UILabel!
//    @IBOutlet var cellAlarmName: UILabel!
//    @IBOutlet var cellAlarmSwitch: UISwitch!
    
    @IBOutlet var cellAlarmTime: UILabel!
    
    @IBOutlet var cellAlarmName: UILabel!
    @IBOutlet var cellAlarmSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
