//
//  menuViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate{
    func settingsButtonPressed(controller: MenuViewController)
    
    func chatButtonPressed(controller : MenuViewController)
}

class MenuViewController : UIViewController {
    
    var delegate : MenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 19/255, green: 19/255, blue: 21/255, alpha: 1)
    }
    
    @IBAction func settingsButtonPressed () {
        if delegate != nil {
            delegate?.settingsButtonPressed(self)
        }
    }
    
    @IBAction func chatButtonPressed () {
        if delegate != nil {
            delegate?.chatButtonPressed(self)
        }
    }

}
