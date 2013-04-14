//
//  WelcomeScreenViewController.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 14/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "WelcomeScreenViewController.h"
#import "CustomCalcViewController.h"
#import "OldOrnamentCalcViewController.h"

@interface WelcomeScreenViewController ()

@end

@implementation WelcomeScreenViewController

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
    self.navigationItem.title = @"Welcome";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchOrderBook:(id)sender {
    
}

- (IBAction)launchCustomCalc:(id)sender {
    CustomCalcViewController *customCalcVC = [[CustomCalcViewController alloc]initWithNibName:@"CustomCalcViewController" bundle:nil];
    [self.navigationController pushViewController:customCalcVC animated:YES];
}

- (IBAction)launchOldOrnamentCalc:(id)sender {
    OldOrnamentCalcViewController *oldCalcVC = [[OldOrnamentCalcViewController alloc]initWithNibName:@"OldOrnamentCalcViewController" bundle:nil];
    [self.navigationController pushViewController:oldCalcVC animated:YES];
}
@end
