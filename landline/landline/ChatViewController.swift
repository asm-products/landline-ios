//
//  ChatViewController.swift
//  landline
//
//  Created by Jason Lagaac on 5/03/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController : UIViewController {
    @IBOutlet var channelScrollView : UIScrollView?
    
    var channels : Array<ChannelViewController> = Array<ChannelViewController>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var contentWidth = UIScreen.mainScreen().bounds.width * 5
        self.channelScrollView?.contentSize = CGSizeMake(contentWidth, 0)
        self.channelScrollView?.pagingEnabled = true
        
        for var i = 0; i < 5; i++ {
            var channel = ChannelViewController.instanceFromStoryboard()
            channel.view.frame = self.channelScrollView!.frame
            var posX = CGFloat(i) * UIScreen.mainScreen().bounds.width;

            var channelFrame = self.channelScrollView!.frame
            channelFrame.origin = CGPointMake(posX, 0)
            channel.view.frame = channelFrame
            
            self.channels.append(channel)
            self.channelScrollView?.addSubview(channel.view)
            self.channelScrollView?.layoutIfNeeded()
        }
    }
}