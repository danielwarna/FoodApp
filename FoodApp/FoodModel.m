//
//  FoodModel.m
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel

@synthesize restaurantName;
@synthesize menu;
@synthesize isVisible;
@synthesize updated;
@synthesize location;

+(NSArray*)fetchMenuList {
    NSURL *theUrl = [NSURL URLWithString:@"http://danno.infa.fi/stuff/foodapptest.json"];
   
    NSURLRequest *urlrequest = [NSURLRequest requestWithURL:theUrl
                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                timeoutInterval:30];
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    urlData = [NSURLConnection sendSynchronousRequest:urlrequest 
                                    returningResponse:&response
                                                error:&error];
}
-(NSString *)getMenuForDay:(NSInteger *)day {
    return (@"This is a menu");
}


@end
