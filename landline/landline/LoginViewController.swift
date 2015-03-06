//
//  LoginViewController.swift
//  landline
//
//  Created by Jason Lagaac on 26/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login() {
        performSegueWithIdentifier("MainViewController", sender: nil)
    }
}

