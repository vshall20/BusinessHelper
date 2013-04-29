//
//  AddNewOrderViewController.m
//  BusinessHelper
//
//  Created by Vishal Dharmawat on 29/04/13.
//  Copyright (c) 2013 Vishal Dharmawat. All rights reserved.
//

#import "AddNewOrderViewController.h"

@interface AddNewOrderViewController (){
    NSArray *list;
}

@end

@implementation AddNewOrderViewController

@synthesize orderList,orderDetail;
@synthesize context,appDelegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    appDelegate = [[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    orderList = [NSEntityDescription
                            insertNewObjectForEntityForName:@"OrderList"
                            inManagedObjectContext:context];
    
//    orderList.orderName = @"TestName";
//    orderList.orderDate = [NSDate date];
//    orderList.orderStatus = @"TestStatus";
    orderDetail = [NSEntityDescription
                                insertNewObjectForEntityForName:@"OrderDetail"
                                inManagedObjectContext:context];
//    orderDetail.orderDescription = @"TestDescription";
//    orderDetail.orderImage = nil;
//    orderList.detail = orderDetail;
    NSError *error;
//    if (![context save:&error]) {
//        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
//    }
    
        // Test listing all FailedBankInfos from the store
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OrderList"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (OrderList *list1 in fetchedObjects) {
        NSLog(@"Name: %@", list1.orderName);
        NSLog(@"Date : %@", list1.orderDate);
        OrderDetail *details = list1.detail;
        NSLog(@"description: %@", details.orderDescription);
    }
    [super viewDidLoad];
    list = [NSArray arrayWithObjects:@"Customer Name",@"Order Date", @"Order Status", @"Order Description", @"Images", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [list count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    if ([[list objectAtIndex:indexPath.section] isEqualToString:@"Order Description"]) {
        CellIdentifier = @"Cell2";
    }
    else {
        CellIdentifier = @"Cell";
    }
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NewOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
       
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [list objectAtIndex:section];
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([[list objectAtIndex:indexPath.section] isEqualToString:@"Order Description"]) {
        return 150;
    }
    else {
        return 40;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NewOrderCell *cell = (NewOrderCell *)textField.superview.superview;
    [self storeValue:cell];
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    NewOrderCell *cell = (NewOrderCell *)textView.superview.superview;
    [self storeValue:cell];
}

-(void)storeValue:(NewOrderCell *)cell {
    NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
    NSLog(@"textFieldDidEndEditing : textfield value is - %ld",(long)indexpath.section);
    switch (indexpath.section) {
        case 0:
            orderList.orderName = cell.textfield.text;
            break;
        case 1:
            orderList.orderDate = [NSDate date];
            break;
        case 2:
            orderList.orderStatus = cell.textfield.text;
            break;
        case 3:
            orderDetail.orderDescription = cell.textView.text;
            break;
        case 4:
            orderDetail.orderImage = nil;
            break;
        default:
            break;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addOrder:(id)sender {
    orderList.detail = orderDetail;
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
