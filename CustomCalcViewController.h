//
//  CustomCalcViewController.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 14/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCalcViewController : UIViewController <UITextFieldDelegate> {
    CGFloat animatedDistance;
}

@property (nonatomic, weak) IBOutlet UITextField *txtTotal;
@property (weak, nonatomic) IBOutlet UITextField *txtRate;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UITextField *txtMakingCharge;
@property (weak, nonatomic) IBOutlet UITextField *txtTax;
@property (weak, nonatomic) IBOutlet UISegmentedControl *makingChargeFactor;

- (IBAction)calculateCost:(id)sender;
- (IBAction)refreshUserDefaults:(id)sender;
- (IBAction)clearFields:(id)sender;

@end
