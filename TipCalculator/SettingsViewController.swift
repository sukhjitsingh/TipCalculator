//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Sukhjit Singh on 12/25/17.
//  Copyright © 2017 Sukhjit Singh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipSegmentedControl.selectedSegmentIndex = defaults.integer(forKey: "DefaultTipValue")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func defaultTipController(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tipSegmentedControl.selectedSegmentIndex, forKey: "DefaultTipValue")
        
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
