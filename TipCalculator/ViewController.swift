//
//  ViewController.swift
//  TipCalculator
//
//  Created by Sukhjit Singh on 12/25/17.
//  Copyright © 2017 Sukhjit Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var bill: Double = 0.0
    var tip: Double = 0.0
    var total: Double = 0.0
    var tipPercent: Double = 0.0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "DefaultTipValue")
        billTextField.becomeFirstResponder()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        self.bill = Double(self.billTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.2, 0.3]
        
        self.tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        self.total = bill + tip
        
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        
        formatter.numberStyle = .currency
        
        if let formattedTipAmount = formatter.string(from: tip as NSNumber) {
            tipLabel.text = formattedTipAmount
        }
        
        if let formattedTotalAmount = formatter.string(from: total as NSNumber) {
            totalLabel.text = formattedTotalAmount
        }
    }
}

