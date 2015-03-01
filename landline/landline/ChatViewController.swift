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
    
    override class func collectionViewLayoutForCoder(decoder: NSCoder) -> UICollectionViewLayout {
        let layout = SLKMessageViewLayout();
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bounces = true
        self.shakeToClearEnabled = true
        self.keyboardPanningEnabled = true
        self.inverted = false
        
        self.textView.placeholder = "Message"
        self.textView.placeholderColor = UIColor.lightGrayColor()
        
        self.leftButton.setImage(UIImage(named: "icn_upload"), forState: UIControlState.Normal)
        self.leftButton.tintColor = UIColor.grayColor()
        self.rightButton.setTitle("Send", forState: UIControlState.Normal)
        
        self.textInputbar.autoHideRightButton = true
        self.textInputbar.maxCharCount = 140
        self.textInputbar.counterStyle = SLKCounterStyle.Split
        
        self.typingIndicatorView.canResignByTouch = true
        
        self.collectionView!.registerClass(SLKMessageViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionView!.backgroundColor = UIColor.whiteColor()
        
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
        self.collectionView.insertItemsAtIndexPaths([idxPath])
        
        self.collectionView.slk_scrollToBottomAnimated(true)
        
        super.didPressRightButton(sender)
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> SLKMessageViewCell {
        
        let message = self.messages[indexPath.row] as String
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as SLKMessageViewCell
        cell.backgroundColor = UIColor.blackColor()
        cell.titleLabel.text = message
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let message = self.messages[indexPath.row] as String
        let width: CGFloat = CGRectGetWidth(collectionView.frame)
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        paragraphStyle.alignment = NSTextAlignment.Left
        
        var attributes: NSDictionary = [NSFontAttributeName: UIFont.systemFontOfSize(17.0), NSParagraphStyleAttributeName: paragraphStyle]
        
        let bounds: CGRect = message.boundingRectWithSize(CGSizeMake(width, 0.0), options:NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
        
        if (message.utf16Count == 0) {
            return 0.0;
        }
        
        return (CGRectGetHeight(bounds)) as CGFloat;
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

