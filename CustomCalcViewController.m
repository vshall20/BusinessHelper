//
//  CustomCalcViewController.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 14/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "CustomCalcViewController.h"


static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


@interface CustomCalcViewController ()

@end

@implementation CustomCalcViewController
@synthesize txtTotal,txtMakingCharge,txtRate,txtTax,txtWeight,makingChargeFactor;

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
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"New Calculator";
    txtTotal.frame = CGRectMake(txtTotal.frame.origin.x, txtTotal.frame.origin.y, txtTotal.frame.size.width, 80);
    txtTotal.text = @"Rs. 0.00";
    txtTotal.textAlignment = NSTextAlignmentRight;
    txtTotal.font = [UIFont systemFontOfSize:60.0];
    txtRate.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"rate"];
    txtMakingCharge.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"makingCharge"];
    txtTax.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"tax"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTxtRate:nil];
    [self setTxtWeight:nil];
    [self setTxtMakingCharge:nil];
    [self setTxtTax:nil];
    [self setMakingChargeFactor:nil];
    [super viewDidUnload];
}


- (void)textFieldDidBeginEditing: (UITextField *) textField
{
    
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size. height;
    
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing: (UITextField *) textField
{
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissKeyboard];
}
-(void)dismissKeyboard {
    NSArray *viewArray = [self.view subviews];
    for (UITextField *textfield in viewArray) {
        if ([textfield isKindOfClass:[UITextField class]]) {
            [textfield resignFirstResponder];
        }
    }
}

- (IBAction)calculateCost:(id)sender
{
    [self dismissKeyboard];
    float total = 0.0f;
    float totalWithTax = 0.0f;
    if (makingChargeFactor.selectedSegmentIndex == 0) {
        total = ([txtRate.text floatValue]*[txtWeight.text floatValue])+([txtRate.text floatValue]*[txtWeight.text floatValue])*[txtMakingCharge.text floatValue]/100;
    }
    else {
        total = ([txtRate.text floatValue]+[txtMakingCharge.text floatValue])*[txtWeight.text floatValue];
    }
    totalWithTax = total + total*[txtTax.text floatValue]/100;
    txtTotal.text = [NSString stringWithFormat:@"Rs. %0.2f",totalWithTax];
}

- (IBAction)refreshUserDefaults:(id)sender {
    [[NSUserDefaults standardUserDefaults]setObject:txtRate.text forKey:@"rate"];
    [[NSUserDefaults standardUserDefaults]setObject:txtMakingCharge.text forKey:@"makingCharge"];
    [[NSUserDefaults standardUserDefaults]setObject:txtTax.text forKey:@"tax"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (IBAction)clearFields:(id)sender {
    txtTotal.text = @"Rs. 0.00";
    txtWeight.text = @"0.00";
}
@end
