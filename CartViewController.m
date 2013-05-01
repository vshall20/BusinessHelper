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
    return cart.ornaments.count;
    
}
-(NSString *)titleForCollapseClickAtIndex:(int)index {
    id temp = [cart.ornaments objectAtIndex:index];
    if ([temp isKindOfClass:[OldOrnamentCalcViewController class]]) {
        return [NSString stringWithFormat:@"%@ gms",[[(OldOrnamentCalcViewController *)temp txtWeight]text] ];
    }
    else {
        return [NSString stringWithFormat:@"%@ gms",[[(CustomCalcViewController *)temp txtWeight]text]];
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
