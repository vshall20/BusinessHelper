//
//  OrderList.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 27/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class OrderDetail;

@interface OrderList : NSManagedObject

@property (nonatomic, retain) NSString * orderName;
@property (nonatomic, retain) NSDate * orderDate;
@property (nonatomic, retain) NSString * orderStatus;
@property (nonatomic, retain) OrderDetail	 *detail;

@end
