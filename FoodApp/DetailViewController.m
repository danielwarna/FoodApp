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
    NSString *dayOfWeek[7] = {@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday'"@"Saturday",@"Sunday"};

    static NSString *CellIdentifier = @"DetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *lunchArray = [restaurantData objectForKey:@"lunchmenu"];
    
    //Creating the header
    UILabel *header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 28)];
    header.text = dayOfWeek[[indexPath row]];
    header.backgroundColor = [UIColor blueColor];
    
    [cell addSubview:header];
   // cell.textLabel.text = [[[[lunchArray objectAtIndex:0]objectForKey:@"items"]objectAtIndex:0]objectForKey:@"name"];
    NSArray *lunchPerDay = [[lunchArray objectAtIndex:[indexPath row]]objectForKey:@"items"];
    
    // Creating the extra cells.
    for (int i=0; i<[lunchPerDay count]; i++) {
        UILabel *label;
        if (i==0) {
            label =[[UILabel alloc]initWithFrame:(CGRectMake(25,40, 280, 20))];
        }else{
            label =[[UILabel alloc]initWithFrame:(CGRectMake(25,40+(i*20), 280, 20))];
        }	
        [label setText:[[lunchPerDay objectAtIndex:i]objectForKey:@"name"]];
        [label setNumberOfLines:2];
        [cell addSubview:label];
        
    }
    
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
- (IBAction)navigateTo:(id)sender {
    
    UIApplication *app = [UIApplication sharedApplication];
    NSMutableString *astring = [[NSMutableString  alloc] initWithString:@"http://maps.google.com/maps?saddr=Current Location&daddr="];
    NSLog(astring);
    [astring appendString:[restaurantData objectForKey:@"address"]];
    NSLog(astring);
    NSString *bString = [astring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(bString);
    [app openURL:[NSURL URLWithString:(bString)]];
}
@end
