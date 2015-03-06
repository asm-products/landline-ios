//
//  MainViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class MainViewController : UIViewController, MenuViewControllerDelegate {
    
    var slideMenuController : SlideMenuController?
    
    var menuViewController : MenuViewController?
    
    var settingsViewController : SettingsViewController?
    
    var chatListViewController : ChatListViewController?
    
    var centralNavigationViewController : CentralNavigationViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCentralViewController()
        loadMenuViewController()
        loadSettingsViewController()
        loadChatViewController()
        
        self.slideMenuController = SlideMenuController(mainViewController: centralNavigationViewController!, leftMenuViewController: menuViewController!)
        self.menuViewController?.view.frame = self.slideMenuController!.leftContainerView.frame

        
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
    
    func loadMenuViewController() {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as? MenuViewController
        self.menuViewController?.delegate = self
    }
    
    func loadSettingsViewController() {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.settingsViewController = storyboard.instantiateViewControllerWithIdentifier("SettingsViewController") as? SettingsViewController
    }
    
    func loadChatViewController() {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.chatListViewController = storyboard.instantiateViewControllerWithIdentifier("ChatListViewController") as? ChatListViewController
        self.centralNavigationViewController?.setViewControllers([self.chatListViewController!], animated: true)
    }
    
    func showMenu() {
        self.slideMenuController?.openLeft()
    }
    
    func settingsButtonPressed(controller: MenuViewController) {
        self.centralNavigationViewController?.setViewControllers([self.settingsViewController!], animated: true)
        self.slideMenuController?.closeLeft()
    }
    
    func chatButtonPressed(controller : MenuViewController) {
        self.centralNavigationViewController?.setViewControllers([self.chatListViewController!], animated: true)
        self.slideMenuController?.closeLeft()
    }
}
