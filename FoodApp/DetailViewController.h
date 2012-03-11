//
//  DetailViewController.h
//  FoodApp
//
//  Created by Labuser on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *RestaurantName;
@property (weak, nonatomic) IBOutlet UILabel *OpenHours;

@property (weak, nonatomic) IBOutlet UITableView *TableView; //Behöver vi en tableview, eller sku de vara lättare att bara generara nå labels eller nå i den stilen?

@end
