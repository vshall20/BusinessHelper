//
//  OrderListTableViewController.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 27/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *orderBook;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@end
