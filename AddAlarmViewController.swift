//
//  AddAlarmViewController.swift
//  AlarmList
//
//  Created by Lixin Sui on 3/13/15.
//  Copyright (c) 2015 De Anza. All rights reserved.
//

import UIKit
import CoreData

class AddAlarmViewController: UIViewController {
    @IBOutlet var AlarmSwitchLabel: UILabel!
    @IBOutlet var AlarmNameAdd: UITextField!
    @IBOutlet var AlarmSwitchAdd: UISwitch!
    @IBOutlet var AlarmTimeAdd: UILabel!
    @IBOutlet var AlarmDateAdd: UIDatePicker!
    
    var LabelAlarmNameText : String!
    var LabelAlarmTimeText : String!
    var DatePickerAlarmTime : NSDate!
    var AlarmSwitchOnOff: NSNumber!
    var existingItem : NSManagedObject!
    
    
    override func loadView() {
        super.loadView()
        
        navigationItem.title = "Alarm"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "dismiss")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .Done, target: self, action: "saveButtonClicked")
        
        let nib = UINib(nibName: "AddAlarmViewController", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: {})
    }
    
    func datePickerChanged(AlarmDateAdd:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "HH:mm"
        
        var strDate = dateFormatter.stringFromDate(AlarmDateAdd.date)
        AlarmTimeAdd.text = strDate
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (existingItem != nil) {
            self.AlarmNameAdd.text = LabelAlarmNameText
            self.AlarmTimeAdd.text = LabelAlarmTimeText
            if AlarmSwitchOnOff == 1 {
                self.AlarmSwitchAdd.setOn(true, animated:true)
                self.AlarmSwitchLabel.text = "Alarm On";
            } else {
                self.AlarmSwitchAdd.setOn(false, animated:true)
                self.AlarmSwitchLabel.text = "Alarm Off";
            }
            self.AlarmDateAdd.setDate(DatePickerAlarmTime, animated: true)
        }
        else{
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.dateFormat = "HH:mm"
            
            var strDate = dateFormatter.stringFromDate(AlarmDateAdd.date)
            AlarmTimeAdd.text = strDate
        }
        AlarmDateAdd.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }

    
    @IBAction func SwitchChanged(sender: AnyObject) {
        if (AlarmSwitchAdd.on) {
            self.AlarmSwitchLabel.text = "Alarm On";
        } else {
            self.AlarmSwitchLabel.text = "Alarm Off";
        }
    }
    

    
    func saveButtonClicked() {
        
        let myMOC = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
        
        if (existingItem != nil) {
            existingItem.setValue(AlarmNameAdd.text as String!, forKey: "alarmName")
            existingItem.setValue(AlarmTimeAdd.text as String!, forKey: "alarmTime")
            existingItem.setValue(AlarmSwitchAdd.on, forKey: "alarmSwitch")
            existingItem.setValue(AlarmDateAdd.date, forKey: "alarmDate")
        }
        else{
            let alarmlistItem = NSEntityDescription.insertNewObjectForEntityForName("AlarmListObject", inManagedObjectContext: myMOC) as AlarmListObject
            
            alarmlistItem.alarmName = AlarmNameAdd.text
            alarmlistItem.alarmTime = AlarmTimeAdd.text
            alarmlistItem.alarmSwitch = AlarmSwitchAdd.on
            alarmlistItem.alarmDate = AlarmDateAdd.date
        }
        
        var saveErr : NSError?
        if myMOC.save(&saveErr) != true {
            println("Insert to DB Error: \(saveErr?.localizedDescription)")
            return
        }
        
        dismissViewControllerAnimated(true, completion: {})
    }
}
