//
//  CartViewController.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 01/05/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController

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
    myCollapseClick.CollapseClickDelegate = self;
    [myCollapseClick reloadCollapseClick];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    myCollapseClick = nil;
    [super viewDidUnload];
}

-(int)numberOfCellsForCollapseClick {
    cart = [Cart instanse];
    return cart.ornaments.count+1;
    
}
-(NSString *)titleForCollapseClickAtIndex:(int)index {
    if (index == cart.ornaments.count) {
        return @"Total";
    }
    NSDictionary *temp = [cart.ornaments objectAtIndex:index];
    if ([temp valueForKey:@"oldGoldWeight"]) {
        return [NSString stringWithFormat:@"%@ gms",[temp valueForKey:@"oldGoldWeight"]];
    }
    else {
        return [NSString stringWithFormat:@"%@ gms",[temp valueForKey:@"newGoldWeight"]];
    }
    
}

-(NSString *)subTitleForCollapseClickAtIndex:(int)index {
    
    if (index == cart.ornaments.count) {
        float total = 0;
        for (int i=0; i<cart.ornaments.count; i++) {
            NSDictionary *temp = [cart.ornaments objectAtIndex:i];
            total += [[temp valueForKey:@"newGoldTotal"] floatValue];
            total -= [[temp valueForKey:@"oldGoldTotal"] floatValue];
        }
        return [NSString stringWithFormat:@"Rs. %0.2f",total];
    }
    NSDictionary *temp = [cart.ornaments objectAtIndex:index];
    if ([temp valueForKey:@"oldGoldTotal"]) {
        return [NSString stringWithFormat:@"Rs. %@",[temp valueForKey:@"oldGoldTotal"]];
    }
    else {
        return [NSString stringWithFormat:@"Rs. %@",[temp valueForKey:@"newGoldTotal"]];
    }
}

-(UIView *)viewForCollapseClickContentViewAtIndex:(int)index {
    switch (index) {
        case 0:
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            view.backgroundColor = [UIColor redColor];
            return view;
            break;
        }
        case 1:
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            view.backgroundColor = [UIColor redColor];
            return view;
            break;
        }
        case 2:
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            view.backgroundColor = [UIColor redColor];
            return view;
            break;
        }
        default:
        {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
            view.backgroundColor = [UIColor redColor];
            return view;
            break;
        }
    }
}
@end
