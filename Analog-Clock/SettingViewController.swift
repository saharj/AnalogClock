//
//  SettingViewController.swift
//  Analog-Clock
//
//  Created by Sahar Jafari on 3/21/15.
//  Copyright (c) 2015 Hakimeh Jafari. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        let nib = UINib(nibName: "SettingViewController", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title = "Settings"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
