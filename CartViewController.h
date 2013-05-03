//
//  CartViewController.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 01/05/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapseClick.h"
#import "Cart.h"
#import "OldOrnamentCalcViewController.h"
#import "CustomCalcViewController.h"
#import "NewGoldDetailViewController.h"

@interface CartViewController : UIViewController <CollapseClickDelegate>{

    __weak IBOutlet CollapseClick *myCollapseClick;
    Cart *cart;

}
@property (nonatomic, strong)NewGoldDetailViewController *nGoldDetailVC;


@end
