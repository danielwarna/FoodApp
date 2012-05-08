//
//  FoodlistViewController.m
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FoodlistViewController.h"
#import "DetailViewController.h"
#import "FoodFetcher.h"


@implementation FoodlistViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"loaded the foodlistviewcontroller");
    
    FoodFetcher *fetcher = [FoodFetcher sharedInstance];
    [fetcher loadData];
    foodData = fetcher.foodData;

    NSLog(@"Fetcherdata count: %i", [foodData count]);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{

    updateButton = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[FoodFetcher sharedInstance] loadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FoodFetcher *fetcher = [FoodFetcher sharedInstance];
    [fetcher loadData];
    DetailViewController *detailView = segue.destinationViewController;
    NSIndexPath *selectedIndexPath;
    selectedIndexPath = [self.tableView indexPathForSelectedRow];
    detailView.restaurantData = [fetcher.foodData objectAtIndex:[selectedIndexPath row]];
    
    NSLog(@"Preparing for segue");
    //detailView.resturantInfo = hämta restauranginfo
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    FoodFetcher *fetcher = [FoodFetcher sharedInstance];
    
    return [fetcher.foodData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    int currentday = [self getWeekDay];
    UILabel *header;
    UILabel *label;
 
    static NSString *CellIdentifier = @"FoodCell";
    FoodFetcher *fetcher = [FoodFetcher sharedInstance];
    [fetcher loadData];
    NSDictionary *foodDict = [fetcher.foodData objectAtIndex:([indexPath row])];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        NSLog(@"Cell was nil");
    }

//    else {
//        
//        header = (UILabel *)[cell.contentView viewWithTag:30];
//        NSLog(@"Cell not nill");
//        NSLog(header.text);
//        header.text = [foodDict objectForKey:@"name"]; 
//        NSLog(header.text);
//
//    }
    
    header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 28)];
    header.text = [foodDict objectForKey:@"name"];
    //header.text = dayOfWeek[[indexPath row]];
    header.backgroundColor = [UIColor grayColor];    
    [cell addSubview:header];
    
    //getting the foodlist as an array, uglyugly code :S
    @try {
        NSArray *foodArray= [[[foodDict objectForKey:@"lunchmenu"] objectAtIndex:currentday]objectForKey:@"items"];
        for (int i=0; i<[foodArray count]; i++) {
            //NSLog([NSString stringWithFormat:@"%d", i ]);
          
                if (i==0) {
                    label =[[UILabel alloc]initWithFrame:(CGRectMake(25,40, 200, 20))];
                }else{
                    label =[[UILabel alloc]initWithFrame:(CGRectMake(25,40+(i*30), 200, 20))];
                }
                label.tag = i;
        
                [label setText:[[foodArray objectAtIndex:i]objectForKey:@"name"]];
                [cell.contentView addSubview:label];
                //[label setText:[[foodArray objectAtIndex:i]objectForKey:@"name"]];
               // [label setNumberOfLines:2];
                [label setFont:[UIFont systemFontOfSize:12]];
                label.lineBreakMode = UILineBreakModeWordWrap;
                [label setNumberOfLines:0];
                [label sizeToFit];
        }
    }
    @catch (NSException *exception) {
        //NSLog(@"No fooditems in array");
    }
    @finally {
        //NSLog(@"Finally do stuff");
    }
    //NSArray *foodArray= [[[foodDict objectForKey:@"lunchmenu"] objectAtIndex:0]objectForKey:@"items"];
    //foodDict = [foodArray objectAtIndex:0];
    //foodArray = [foodDict objectForKey:@"items"];

    // Configure the cell...
    
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //This is where we calculate the cell rowheight
    FoodFetcher *fetcher = [FoodFetcher sharedInstance];
    [fetcher loadData];
    NSDictionary *foodDict = [fetcher.foodData objectAtIndex:([indexPath row])];
    @try {
        NSArray *foodArray= [[[foodDict objectForKey:@"lunchmenu"] objectAtIndex:0]objectForKey:@"items"];
        //NSLog([NSString stringWithFormat:@"%d",[foodArray count]]);
        return [foodArray count]*40;
    }
    @catch (NSException *exception) {
        return 30;
    }
    @finally {
        
    }
    
    
    //int height = [foodArray count]*20;
    //return height;
    //return 180;
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

-(int)getWeekDay
{
    NSData *date =[NSDate date];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
    int weekday = (([comps weekday]+5)%7);
    
    NSLog(@"Week day is %i", weekday);
    return weekday;
    
}

- (IBAction)update:(id)sender {
    FoodFetcher *fetcher = [FoodFetcher sharedInstance];
    [fetcher fetchFoodList];
    //foodData = fetcher.foodData;
    [self.tableView reloadData];
}
@end
