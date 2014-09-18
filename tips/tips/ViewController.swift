//
//  ViewController.swift
//  tips
//
//  Created by Maricel Quesada on 9/16/14.
//  Copyright (c) 2014 Maricel Quesada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipLabelValue: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set default tip percentage
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        // Hide container view for animations
        hideContainerAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        var billAmount =  NSString(string: billField.text).doubleValue
        
        // Calculate tip only if bill amount is greater than 0
        if (billAmount > 0) {
            // Show view container with animation
            showContainerAnimation()
            
            // Calculate tip and total
            calculateTipAndTotal(billAmount)
        
        } else {
            // Hide container view with animation
            hideContainerAnimation()
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /* Calculates the tip and total given a bill amount */
    func calculateTipAndTotal(billAmount: Double) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
    
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabelValue.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }
    
    func hideContainerAnimation() {
        self.container.alpha = 0
    }
    
    func showContainerAnimation() {
        self.container.alpha = 1
    }


}

