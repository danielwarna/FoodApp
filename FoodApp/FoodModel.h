//
//  FoodModel.h
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface FoodModel : NSObject

@property(nonatomic, retain) NSString *restaurantName;
@property(nonatomic, retain) NSArray *menu;
@property(nonatomic, retain) NSString *openingHours;

@property (nonatomic, assign) CLLocationCoordinate2D location;

@property(nonatomic) bool *isVisible;
@property(nonatomic, retain) NSData *updated;


-(NSString*) getMenuForDay:(NSInteger*) day;
+(NSArray*) fetchMenuList;

//Encoderfunctioner
- (void) encodeWithCoder:(NSCoder *)encoder;
- (id) initWithCoder:(NSCoder *)decoder;

@end

