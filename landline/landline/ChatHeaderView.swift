//
//  ChatHeaderView.swift
//  landline
//
//  Created by Jason Lagaac on 5/03/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import Foundation
import UIKit

class ChatHeaderView : UIView, UIScrollViewDelegate {
    
    @IBOutlet var channelListScrollView : UIScrollView?
    
    var contentSize : CGSize?
    
    override func layoutSubviews() {
        self.channelListScrollView?.pagingEnabled = true
        
        self.contentSize = self.bounds.size;
        self.contentSize!.width += 15
        self.contentSize!.width *= 5
        
        self.channelListScrollView?.contentSize = contentSize!
        for var i = 0; i < 5; i++ {
            var pos_x = (CGFloat(i) * (self.bounds.width)) + 25
            var page =  UILabel(frame: CGRectMake(pos_x, 0, (self.bounds.width - 50), 25))
            page.text = "#channel-\(i)"
            page.textAlignment = NSTextAlignment.Center
            page.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
            page.textColor = UIColor.whiteColor()
            
            self.channelListScrollView?.addSubview(page)
        }
        
        super.layoutSubviews()
    }

    class func instanceFromNib() -> ChatHeaderView {
        return self.loadFromNibNamed("ChatHeaderView", bundle: nil) as ChatHeaderView
    }
    
    func scrollToPage(page : Int) {
        var posFrame = channelListScrollView!.frame;
        posFrame.origin.x = posFrame.size.width * CGFloat(page);
        frame.origin.y = 0;
        channelListScrollView?.scrollRectToVisible(posFrame, animated: true)
    }
}
