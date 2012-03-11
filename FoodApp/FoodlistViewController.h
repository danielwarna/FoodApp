//
//  FoodlistViewController.h
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodlistViewController : UITableViewController

@property (retain, nonatomic) NSArray *RestaurantList;
@property (weak, nonatomic) IBOutlet UILabel *Restaurant;
@property (weak, nonatomic) IBOutlet UILabel *Matratter;

@end
	