//
//  DetailViewController.m
//  FoodApp
//
//  Created by Labuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize RestaurantName;
@synthesize OpenHours;
@synthesize TableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializationß
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    //view appears
    NSLog(@"Detailview will appera");
}

- (void)viewDidUnload {
    [self setRestaurantName:nil];
    [self setOpenHours:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
