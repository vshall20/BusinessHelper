//
//  OrderForm.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 21/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface OrderForm : NSManagedObject

@property (nonatomic, retain) NSNumber * customerId;
@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSDate * orderDate;
@property (nonatomic, retain) NSString * orderDescription;

@end
