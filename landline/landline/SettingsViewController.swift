//
//  SettingsViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    
    
    @IBAction func showMenu() {
        NSNotificationCenter.defaultCenter().postNotificationName("showMenu", object: nil)
    }
    
}
