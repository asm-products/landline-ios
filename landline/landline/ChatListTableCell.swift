//
//  ChatListTableCell.swift
//  landline
//
//  Created by Jason Lagaac on 1/03/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import UIKit

class ChatListTableCell : UITableViewCell {
    
    @IBOutlet var chatNameLbl : UILabel?
    
    @IBOutlet var chatIconImageView : UIImageView?
    
    func setChatIconImage(image : UIImage) {
        chatIconImageView?.image = image;
    }
    
}
