//
//  ChatListViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class ChatListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func showMenu() {
        NSNotificationCenter.defaultCenter().postNotificationName("showMenu", object: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ChatListTableViewCell") as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ChatViewController", sender: nil);
    }
}
