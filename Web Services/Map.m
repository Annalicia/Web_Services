//
//  Map.m
//  Web Services
//
//  Created by Walter Gonzalez Domenzain on 06/08/16.
//  Copyright © 2016 UAG. All rights reserved.
//

#import "Map.h"
@import GoogleMaps;

#define nLat @"20.694073"
#define nLng @"-103.421259"

@interface Map ()

@end

@implementation Map {
    GMSMapView *mapView_;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (void)createMap {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera   = [GMSCameraPosition cameraWithLatitude:20.6947103
                                                              longitude:-103.4203145
                                                                   zoom:17];
    mapView_                    = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled  = YES;
    mapView_.trafficEnabled     = YES;
    mapView_.indoorEnabled      = YES;
    mapView_.buildingsEnabled      = YES;
    self.view                   = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(20.6947103, -103.4203145);
    marker.title = @"UAG";
    marker.snippet = @"Clase de Maestría";
    marker.map = mapView_;
}
@end
