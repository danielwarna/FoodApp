//
//  DetailViewController.h
//  FoodApp
//
//  Created by Labuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodModel.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UITableView *foodListTable;
}

@property (nonatomic, retain) IBOutlet UINavigationBar *TitleBar;
@property (nonatomic, retain) IBOutlet UILabel *RestaurantName;
@property (nonatomic, retain) IBOutlet UILabel *OpenHours;

@property (nonatomic, retain) IBOutlet UITableView *foodListTable; //Behöver vi en tableview, eller sku de vara lättare att bara generara nå labels eller nå i den stilen?
@property (nonatomic, retain) IBOutlet UIButton *NavigateButton;

@property(retain, nonatomic) NSDictionary *restaurantData;


- (IBAction)navigateTo:(id)sender;

@end
