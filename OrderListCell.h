//
//  OrderListCell.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 27/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *orderName;
@property (nonatomic, strong) IBOutlet UILabel *orderDate;
@property (nonatomic, strong) IBOutlet UILabel *orderStatus;
@end
