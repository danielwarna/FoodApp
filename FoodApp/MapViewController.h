//
//  MapViewController.h
//  FoodApp
//
//  Created by Labuser on 2/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UITableViewController <MKMapViewDelegate>
{
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;


@end
