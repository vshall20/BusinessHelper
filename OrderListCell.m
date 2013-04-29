//
//  OrderListCell.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 27/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "OrderListCell.h"

@implementation OrderListCell
@synthesize orderName, orderDate, orderStatus;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        orderName = [[UILabel alloc]init];
        orderDate = [[UILabel alloc]init];
        orderStatus = [[UILabel alloc]init];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
