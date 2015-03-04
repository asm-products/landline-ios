//
//  ChatListViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class ChatListViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedChatName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showMenu() {
        NSNotificationCenter.defaultCenter().postNotificationName("showMenu", object: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : ChatListTableCell = tableView.dequeueReusableCellWithIdentifier("ChatListTableCell") as ChatListTableCell

        switch (indexPath.row) {
            case 0:
                cell.chatNameLbl?.text = "Landline"
            case 1:
                cell.chatNameLbl?.text = "Assembly"
            case 2:
                cell.chatNameLbl?.text = "The Super Friends"
            default:
                break
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell : ChatListTableCell = tableView.cellForRowAtIndexPath(indexPath) as ChatListTableCell
        
        selectedChatName = cell.chatNameLbl!.text!
        performSegueWithIdentifier("ChatViewController", sender: nil);
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ChatViewController" {
            var vc = segue.destinationViewController as ChatViewController
            vc.navigationItem.title = selectedChatName
        }
    }
}
