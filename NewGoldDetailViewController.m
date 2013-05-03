//
//  NewGoldDetailViewController.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 03/05/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "NewGoldDetailViewController.h"

@interface NewGoldDetailViewController ()

@end

@implementation NewGoldDetailViewController
@synthesize lblTotal,lblTax,lblMakingCharge,lblWeight,lblRate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLblRate:nil];
    [self setLblWeight:nil];
    [self setLblMakingCharge:nil];
    [self setLblTax:nil];
    [self setLblTotal:nil];
    [super viewDidUnload];
}
@end
