//
//  OldOrnamentCalcViewController.h
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 14/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OldOrnamentCalcViewController : UIViewController  <UITextFieldDelegate> {
    CGFloat animatedDistance;
}

@property (weak, nonatomic) IBOutlet UITextField *txtTotal;
@property (weak, nonatomic) IBOutlet UITextField *txtRate;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UITextField *txtPurity;

- (IBAction)clearAllFields:(id)sender;
- (IBAction)calculate:(id)sender;
- (IBAction)refreshUserDefaults:(id)sender;

@end
