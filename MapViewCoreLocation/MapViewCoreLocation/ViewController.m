//
//  ViewController.m
//  MapViewCoreLocation
//
//  Created by Hugo Luiz Chimello on 2/26/15.
//  Copyright (c) 2015 Hugo Luiz Chimello. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager;
MKCoordinateRegion region;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc]init];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDelegate:self];
    
    //permissão
    
    if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [locationManager requestWhenInUseAuthorization];
    }
    
    [locationManager startUpdatingLocation];
    
    _mainMap.showsUserLocation = YES;
    
    
}

- (IBAction)atualizar:(id)sender{
    [_mainMap setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocationCoordinate2D loc=[[locations lastObject]coordinate];
    
    region = MKCoordinateRegionMakeWithDistance(loc,150,150);
    NSLog(@"%@", [locations lastObject]);
    
}

-(void) locationManager:(CLLocationManager *)manager didfailWithError:(NSError *)locations{
    
}
//#define METERS_PER_MILE 1609.344
//
//-(void)viewWillAppear:(BOOL)animated{
//    
//    CLLocationCoordinate2D zoomLocation;
//    zoomLocation.latitude=39.281516;
//    zoomLocation.longitude=-76.580806;
//    
//    MKCoordinateRegion viewRegion= MKCoordinateRegionMakeWithDistance(zoomLocation , 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
//    
//    [_mainMap setRegion:viewRegion animated:YES];
//}
@end
