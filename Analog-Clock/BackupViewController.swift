////
////  BackupViewController.swift
////  Analog-Clock
////
////  Created by Sahar Jafari on 3/6/15.
////  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
////
//
//import UIKit
//
//class BackupViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    @IBOutlet var ViewForLayer: UIView!
//    
//    
//    var hourHand : CALayer {
//        return ViewForLayer.layer
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        hourHand.frame = CGRect(x: 400, y: 400, width: 100, height: 20)
//        
//        setHourHandImage()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    func setHourHandImage (){
//        hourHand.backgroundColor = UIColor.blackColor().CGColor
//        hourHand.cornerRadius = 5;
//        
//    }
//    
//    
//    //    func start {
//    //        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
//    //    }
//    
//    func Degrees2Radians (degrees: Float) -> Float {
//        return degrees * Float(M_PI) / 180
//    }
//    
//    func updateClock (theTimer: NSTimer) {
//        let calendar = NSCalendar.currentCalendar()
//        let date = NSDate()
//        
//        let dateComponents : NSDateComponents = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
//        
//        
//        
//        var seconds : Int = dateComponents.second
//        var minutes : Int = dateComponents.minute
//        var hours : Int = dateComponents.hour
//        
//        //NSLog(@"raw: hours:%d min:%d secs:%d", hours, minutes, seconds);
//        if (hours > 12){
//            
//            hours -= 12; //PM
//        }
//        
//        //set angles for each of the hands
//        var secAngle : Float = Degrees2Radians(Float(seconds) / 60.0 * 360)
//        var minAngle : Float = Degrees2Radians(Float(minutes) / 60.0 * 360)
//        var hourAngle : Float = Degrees2Radians(Float(hours) / 12.0 * 360) + minAngle / 12.0
//        
//        //reflect the rotations + 180 degres since CALayers coordinate system is inverted
//        //        if (self.secHandContinuos) {
//        //            var prevSecAngle : Float = Degrees2Radians((Float(seconds) - 1) / 60.0 * 360);
//        //        [secHand removeAnimationForKey: "transform"];
//        //
//        //            let ani : CABasicAnimation = [CABasicAnimation.animationWithKeyPath: "transform"]
//        //        ani.duration = 1.f
//        //        ani.fromValue = [NSValue.valueWithCATransform3D: CATransform3DMakeRotation(prevSecAngle + M_PI, 0, 0, 1)]
//        //        ani.toValue = [NSValue.valueWithCATransform3D: CATransform3DMakeRotation(secAngle + M_PI, 0, 0, 1)]
//        //        [secHand.addAnimation: ani, forKey: "transform"]
//        //
//        //        } else {
//        //        secHand.transform = CATransform3DMakeRotation (secAngle+M_PI, 0, 0, 1);
//        //        }
//        
//        //        minHand.transform = CATransform3DMakeRotation(CGFloat(minAngle) + CGFloat(M_PI), 0, 0, 1);
//        hourHand.transform = CATransform3DMakeRotation(CGFloat(hourAngle) + CGFloat(M_PI), 0, 0, 1);
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//
