//
//  SLKMessageViewCell.m
//  Messenger
//
//  Created by Ignacio Romero Z. on 11/4/14.
//  Copyright (c) 2014 Slack Technologies, Inc. All rights reserved.
//

#import "SLKMessageViewCell.h"

@implementation SLKMessageViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (!_titleLabel) {
            _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
            _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _titleLabel.numberOfLines = 0;
            _titleLabel.backgroundColor = [UIColor lightGrayColor];
            _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            [self.contentView addSubview:self.titleLabel];
        }
    }
    return self;
}

- (void)prepareForReuse
{
    self.titleLabel.text = nil;
}

@end
