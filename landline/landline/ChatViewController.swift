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
    var avatars : Array<String> = Array<String>()
    
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
            let message : String = LoremIpsum.wordsWithNumber(50)
            self.messages.append(message)
            
            var imageName = "UserAvatar\(rand() % 3 + 1)"
            self.avatars.append(imageName)
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        let idxPath : NSIndexPath = NSIndexPath(forItem: self.messages.count - 1, inSection: 0)

        self.tableView.scrollToRowAtIndexPath(idxPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
    }
    
    override func didPressRightButton(sender: AnyObject!) {
        self.textView.refreshFirstResponder()
        
        let message = self.textView.text.copy() as NSString
        let avatar = "UserAvatar4"
        
        self.messages.append(message)
        self.avatars.append(avatar)
        
        let idxPath : NSIndexPath = NSIndexPath(forItem: self.messages.count - 1, inSection: 0)
        self.tableView.reloadData()
        self.tableView.scrollToRowAtIndexPath(idxPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        
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
        
        var cell : ChatMessageCell? = tableView.dequeueReusableCellWithIdentifier("ChatMessageCell", forIndexPath: indexPath) as? ChatMessageCell
        let message = self.messages[indexPath.row] as String
        var avatar : String = self.avatars[indexPath.row] as String
        
        cell?.userImageView?.image = UIImage(named: avatar);
        cell?.messageLbl?.text = message;
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let message = self.messages[indexPath.row]
        let width: CGFloat = CGRectGetWidth(tableView.frame) - 63.0
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        paragraphStyle.alignment = NSTextAlignment.Left
        
        var attributes: NSDictionary = [NSFontAttributeName: UIFont.systemFontOfSize(17.0), NSParagraphStyleAttributeName: paragraphStyle]
        
        var msgSize : CGRect = message.boundingRectWithSize(CGSizeMake(250, 1000), options:NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
        var msgHeight = (msgSize.height < 100 ? 100 : msgSize.height + 10)
        var bounds = CGRectMake(0, 0, 250, msgHeight)
    
        return (CGRectGetHeight(bounds)) as CGFloat;
    }

    
    // MARK: - UICollectionViewDataSource
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

