//
//  ChatMessageCell.swift
//  landline
//
//  Created by Jason Lagaac on 1/03/2015.
//  Copyright (c) 2015 landline. All rights reserved.
//

import Foundation
import UIKit

class ChatMessageCell : UITableViewCell {
    class func instanceFromNib() -> ChatMessageCell {
        return self.loadFromNibNamed("ChatMessageCell", bundle: nil) as ChatMessageCell
    }
}