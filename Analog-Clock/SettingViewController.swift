//
//  SettingViewController.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/21/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit
import QuartzCore
import CoreData

let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
var fetchedResultsController : NSFetchedResultsController!

var InitObjects : [AlarmListObject] = []


class SettingViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: Selector("openAddAlarm"))
        navigationItem.rightBarButtonItem = addButton
        
        navigationItem.title = "Settings"
        
        let alarmTableViewCellNib = UINib(nibName: "AlarmTableViewCell", bundle: nil)
        
        tableView.registerNib(alarmTableViewCellNib, forCellReuseIdentifier: "Alarm")
        tableView.rowHeight = 72
        
        let fetchRequest = NSFetchRequest(entityName: "AlarmListObject")
        
        var e: NSError?
        
        let sortDescriptor = NSSortDescriptor(key: "alarmTime", ascending : true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        var fetchResult = fetchedResultsController.performFetch(&e)
        InitObjects = fetchedResultsController.fetchedObjects as [AlarmListObject]
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController!) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath!) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        case .Update:
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            tableView.reloadData()
        }
        InitObjects = controller.fetchedObjects as [AlarmListObject]
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "AlarmListObject")
        var e: NSError?
        
        InitObjects = managedContext.executeFetchRequest(fetchRequest, error: &e) as [AlarmListObject]
        
        if e != nil {
            println("Failed to retrieve record: \(e!.localizedDescription)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return InitObjects.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellObject : AlarmListObject
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Alarm", forIndexPath: indexPath) as AlarmTableViewCell
        
        // Configure the cell...
        cellObject = InitObjects[indexPath.row]
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        var strDate = dateFormatter.stringFromDate(cellObject.alarmDate)
        
        cell.cellAlarmName?.text = cellObject.alarmName
        cell.cellAlarmTime?.text = strDate
        if cellObject.alarmSwitch == 1
        {
            cell.cellAlarmSwitch.setOn(true, animated:true)
        }
        else{
            cell.cellAlarmSwitch.setOn(false, animated:true)
        }
        //        var enabledSwitch = UISwitch(frame: CGRectZero) as UISwitch
        //        if cellObject.alarmSwitch == 1
        //        {
        //            enabledSwitch.on = true
        //        }
        //        else{
        //            enabledSwitch.on = false
        //        }
        //        cell.accessoryView = enabledSwitch
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //        let UpdateItem = self.fetchedResultsController.objectAtIndexPath(indexPath) as AlarmListObject
        //
        //        let cellIdentifier = "SetAlarmCell"
        //        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as AlarmTableViewCell
        //
        //
        //        if cell.cellAlarmSwitch.on {
        //            UpdateItem.alarmSwitch = 1
        //        } else {
        //            UpdateItem.alarmSwitch = 0
        //        }
        //
        //
        //        var e: NSError?
        //        if managedObjectContext!.save(&e) != true {
        //            println("update error: \(e!.localizedDescription)")
        //        }
        //
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let delItem = fetchedResultsController.objectAtIndexPath(indexPath) as AlarmListObject
        managedObjectContext!.deleteObject(delItem)
        
        var e: NSError?
        if managedObjectContext!.save(&e) != true {
            println("delete error: \(e!.localizedDescription)")
        }
    }
    
    func openAddAlarm() {
        let addAlarm = AddAlarmViewController()
        
        let navCtrl = UINavigationController()
        navCtrl.pushViewController(addAlarm, animated: false)
        
        presentViewController(navCtrl, animated: true, completion: {})
    }
    
}