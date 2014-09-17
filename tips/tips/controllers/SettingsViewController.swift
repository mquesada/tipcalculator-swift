//
//  SettingsViewController.swift
//  tips
//
//  Created by Maricel Quesada on 9/16/14.
//  Copyright (c) 2014 Maricel Quesada. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var defaultTip: UISegmentedControl
    
    @IBOutlet var saveButton: UIButton
    
    @IBAction func saveDefaultTipPercentage(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTip.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func closeSettings(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        defaultTip.selectedSegmentIndex = defaultTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
