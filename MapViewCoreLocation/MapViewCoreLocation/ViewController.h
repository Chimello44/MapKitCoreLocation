//
//  ViewController.h
//  MapViewCoreLocation
//
//  Created by Hugo Luiz Chimello on 2/26/15.
//  Copyright (c) 2015 Hugo Luiz Chimello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController{
    
}
@property (weak, nonatomic) IBOutlet MKMapView *mainMap;
@property(retain) CLLocationManager *locationManager;
- (IBAction)atualizar:(id)sender;

@end

