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
    
    var chatViewController : ChatViewController? = ChatViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
        self.menuViewController?.view.frame = self.view.frame;
        self.chatViewController?.view.frame = self.view.frame;
        
        self.slideMenuController = SlideMenuController(mainViewController: chatViewController!, leftMenuViewController: menuViewController!)
        
        self.addChildViewController(self.slideMenuController!)
        self.slideMenuController?.view.frame = self.view.frame
        self.view.addSubview(self.slideMenuController!.view!)
    }
    
    @IBAction func showMenu() {
        self.slideMenuController?.openLeft()
    }
}
