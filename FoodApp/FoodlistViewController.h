//
//  FoodlistViewController.h
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodlistViewController : UITableViewController {
    NSArray *foodData;
    IBOutlet UIBarButtonItem *updateButton;
}
- (IBAction)update:(id)sender;
- (int)getWeekDay;

@end
	