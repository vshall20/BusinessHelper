//
//  AddNewOrderViewController.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 29/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderList.h"
#import "OrderDetail.h"
#import "AppDelegate.h"
#import "NewOrderCell.h"

@interface AddNewOrderViewController : UITableViewController<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) OrderList *orderList;
@property (nonatomic, strong) OrderDetail *orderDetail;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) AppDelegate *appDelegate;

- (IBAction)cancelPressed:(id)sender;
- (IBAction)addOrder:(id)sender;

@end
