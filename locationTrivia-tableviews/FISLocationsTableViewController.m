//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Henry Dinhofer on 6/23/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()


@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"standardCell" forIndexPath:indexPath];
    
    FISLocation *rowItem = self.locations[indexPath.row];
    cell.textLabel.text = rowItem.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", rowItem.trivia.count];
    
    
//    cell.textLabel.text = self.locations[indexPath.row];
//    cell.detailTextLabel.text = self.locations
//    for (FISLocation *place in self.locations){
//        cell.textLabel.text = place.name;
//        cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", place.trivia.count];
//    }
//
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISTriviaTableViewController *destinationVC = (FISTriviaTableViewController *)segue.destinationViewController;
    
//First way
    NSIndexPath *rowSelected = [self.tableView indexPathForSelectedRow];
    destinationVC.trivia = ((FISLocation *)self.locations[rowSelected.row]).trivia;
    
    //FISLocation *locationSelected = self.locations[rowSelected.row];
    //NSArray *triviumToBePassed = locationSelected.trivia;
    //destinationVC.trivia = triviumToBePassed;
    
//Second way
 /*   UITableViewCell *cell = (UITableViewCell *)sender;
    NSArray *triviumToBePassed = [[NSArray alloc] init];
    for (FISLocation *place in self.locations) {
        if ([cell.textLabel.text isEqualToString: place.name ]) {
            triviumToBePassed = place.trivia;
        }
    }
    destinationVC.trivia = triviumToBePassed;
 */
    
    
}


@end
