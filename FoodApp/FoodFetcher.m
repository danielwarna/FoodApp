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

- (id)init {
    [self fetchFoodList];
    return self;
}

- (void)fetchFoodList {
    dispatch_async(bgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:foodListURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

- (void)fetrchedData:(NSData *)responseData {
    NSError* error;
    NSArray* jsonArray = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:0
                          error:&error];
    
    self.foodData = jsonArray;
}

@end
