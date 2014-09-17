//
//  ViewController.swift
//  tips
//
//  Created by Maricel Quesada on 9/16/14.
//  Copyright (c) 2014 Maricel Quesada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField
    @IBOutlet weak var tipLabel: UILabel
    @IBOutlet weak var totalLabel: UILabel
    @IBOutlet var tipControl: UISegmentedControl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set default tip percentage
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text.bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }


}

