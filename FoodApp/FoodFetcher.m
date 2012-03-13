//
//  FoodFetcher.m
//  FoodApp
//
//  Created by Mathias Fredriksson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define bgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define foodListURL [NSURL URLWithString: @"http://anemos.infa.fi/foodlist.json"]

#import "FoodFetcher.h"

@implementation FoodFetcher

@synthesize foodData;

+ (id)sharedInstance {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        [_sharedObject fetchFoodList];
    });
    return _sharedObject;
}

- (void)fetchFoodList {
    dispatch_async(bgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:foodListURL];
        [self performSelectorOnMainThread:@selector(fetchData:) withObject:data waitUntilDone:YES];
    });
}

- (void)fetchData:(NSData *)responseData {
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:0
                          error:&error];
    
    NSLog(@"First object on list: %@", [[jsonArray objectAtIndex:0] objectForKey:@"name"]);
    
    [self setFoodData:jsonArray];
}

@end
