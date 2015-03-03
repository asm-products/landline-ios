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
    
    var centralNavigationViewController : CentralNavigationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCentralViewController()
        
        self.menuViewController?.view.frame = self.view.frame;
        self.slideMenuController = SlideMenuController(mainViewController: centralNavigationViewController!, leftMenuViewController: menuViewController!)
        
        self.addChildViewController(self.slideMenuController!)
        self.slideMenuController?.view.frame = self.view.frame
        self.view.addSubview(self.slideMenuController!.view!)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showMenu", name: "showMenu", object: nil);
    }
    
    func loadCentralViewController() {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.centralNavigationViewController = storyboard.instantiateViewControllerWithIdentifier("CentralNavigationViewController") as?CentralNavigationViewController
        self.centralNavigationViewController?.view.frame = self.view.frame;
    }
    
    func showMenu() {
        self.slideMenuController?.openLeft()
    }
}
