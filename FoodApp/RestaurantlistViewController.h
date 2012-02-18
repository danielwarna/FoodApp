//
//  RestaurantlistViewController.h
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantlistViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *Restaurant;
@property (weak, nonatomic) IBOutlet UILabel *restaurantInfo;
@property (weak, nonatomic) IBOutlet UIImageView *restaurantLogo;

@end
