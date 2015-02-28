//
//  MainViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class MainViewController : UIViewController {
    
    var slideMenuController : SlideMenuController?
    
    var menuViewController : MenuViewController? = MenuViewController()
    
    var centralViewController : UINavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCentralViewController()
        
        self.navigationController?.navigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        
        self.menuViewController?.view.frame = self.view.frame;
        self.slideMenuController = SlideMenuController(mainViewController: centralViewController!, leftMenuViewController: menuViewController!)
        
        self.addChildViewController(self.slideMenuController!)
        self.slideMenuController?.view.frame = self.view.frame
        self.view.addSubview(self.slideMenuController!.view!)
    }
    
    func loadCentralViewController() {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.centralViewController = storyboard.instantiateViewControllerWithIdentifier("CentralViewController") as?UINavigationController
        self.centralViewController?.view.frame = self.view.frame;
    }
    
    @IBAction func showMenu() {
        self.slideMenuController?.openLeft()
    }
}
