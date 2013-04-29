//
//  OrderDetail.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 27/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class OrderList;

@interface OrderDetail : NSManagedObject

@property (nonatomic, retain) NSString * orderDescription;
@property (nonatomic, retain) NSData * orderImage;
@property (nonatomic, retain) OrderList *order;

@end
