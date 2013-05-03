//
//  NewGoldDetailViewController.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 03/05/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewGoldDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblRate;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblMakingCharge;
@property (weak, nonatomic) IBOutlet UILabel *lblTax;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;

@end
