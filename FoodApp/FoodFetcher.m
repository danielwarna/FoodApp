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
    [self saveData];
}

- (void) encodeWithCoder:(NSCoder *)encode {
    [encode encodeObject:self.foodData forKey:@"foodData"];
}

- (id) initWithCoder:(NSCoder *)decoder {
    self = [[FoodFetcher alloc]init];
    if(self != nil){
        self.foodData = [decoder decodeObjectForKey:@"foodData"];
    }
    return self;
}

- (void) saveData {
    //Saves an array in NSUserDefaults
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:foodData];
    [defaults setObject:data forKey:[NSString stringWithFormat:@"myKey"]];
    [defaults synchronize];
    
    NSLog(@"Saved stuff to user defaults %i", [foodData count]);
    
}

- (NSArray*) loadData {
    //Loads data from NSUserDefaults and returns it in an array
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:[NSString stringWithFormat:@"myKey"]];
    foodData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    //NSLog(@"Loading stuff from user defaults %i", [foodData count]);
    return foodData;
}



@end
