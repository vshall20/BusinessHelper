//
//  Cart.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 01/05/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "Cart.h"

@implementation Cart

@synthesize ornaments;


static Cart * _sharedMySingleton = nil;

+(Cart*)instanse
{
    @synchronized([Cart class])
    {
        if (!_sharedMySingleton)
            _sharedMySingleton = [[self alloc] init];
        
    }
    return _sharedMySingleton;
}

-(id)init {
    ornaments = [[NSMutableArray alloc]init];
    return self;
}
@end
