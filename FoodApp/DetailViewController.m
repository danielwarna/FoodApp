//
//  DetailViewController.m
//  FoodApp
//
//  Created by Labuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize NavigateButton;
@synthesize TitleBar;
@synthesize RestaurantName;
@synthesize OpenHours;
@synthesize foodListTable;
@synthesize restaurantData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializationß
    }
    [foodListTable setDelegate:self];
    [foodListTable setDataSource:self];
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    //view appears
    NSLog(@"Detailview will appera");
    RestaurantName.text = [restaurantData objectForKey:@"name"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[restaurantData objectForKey:@"lunchmenu"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *lunchArray = [restaurantData objectForKey:@"lunchmenu"];
    
    cell.textLabel.text = [[[[lunchArray objectAtIndex:0]objectForKey:@"items"]objectAtIndex:0]objectForKey:@"name"];
    
    // Configure the cell...
    
    return cell;
}


- (void)viewDidUnload {
    [self setRestaurantName:nil];
    [self setOpenHours:nil];
    [self setFoodListTable:nil];
    [self setNavigateButton:nil];
    [self setTitleBar:nil];
    [super viewDidUnload];
}
@end
