//
//  ChatViewController.swift
//  landline
//
//  Created by Jason Lagaac on 28/02/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController : SLKTextViewController {
    
    var messages : Array<String> = Array<String>()
    
    override class func tableViewStyleForCoder(decoder: NSCoder) -> UITableViewStyle {
        return UITableViewStyle.Plain;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bounces = true
        self.shakeToClearEnabled = true
        self.keyboardPanningEnabled = true
        self.inverted = false
        
        self.textView.placeholder = "Message"
        self.textView.placeholderColor = UIColor.clearColor()
        
        self.leftButton.setImage(UIImage(named: "icn_upload"), forState: UIControlState.Normal)
        self.leftButton.tintColor = UIColor.grayColor()
        self.rightButton.setTitle("Send", forState: UIControlState.Normal)
        
        self.textInputbar.autoHideRightButton = true
        self.textInputbar.maxCharCount = 140
        self.textInputbar.counterStyle = SLKCounterStyle.Split
        
        self.typingIndicatorView.canResignByTouch = true
        
        var nib : UINib = UINib(nibName: "ChatMessageCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "ChatMessageCell")
        self.tableView!.backgroundColor = UIColor.whiteColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
        
        for index in 0...3 {
            let message : String = LoremIpsum.wordsWithNumber(20)
            self.messages.append(message)
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didPressRightButton(sender: AnyObject!) {
        
        self.textView.refreshFirstResponder()
        
        let message = self.textView.text.copy() as NSString
        
        self.messages.insert(message, atIndex: 0)
        
        let idxPath : NSIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([idxPath], withRowAnimation: UITableViewRowAnimation.None)
        
        self.tableView.slk_scrollToBottomAnimated(true)
        
        super.didPressRightButton(sender)
    }
//
//    // MARK: - UICollectionViewDataSource
//    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let message = self.messages[indexPath.row] as String
        var cell : ChatMessageCell? = tableView.dequeueReusableCellWithIdentifier("ChatMessageCell", forIndexPath: indexPath) as? ChatMessageCell
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    
    // MARK: - UICollectionViewDataSource
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

