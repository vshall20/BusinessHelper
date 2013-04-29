//
//  NewOrderCell.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 29/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "NewOrderCell.h"

@implementation NewOrderCell

@synthesize textfield,textView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
