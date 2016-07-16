//
//  ViewController.m
//  Web Services
//
//  Created by Walter Gonzalez Domenzain on 15/07/16.
//  Copyright © 2016 UAG. All rights reserved.
//

#import "Home.h"

#define nLat @"20.694073"
#define nLng @"-103.421259"


@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    mjsonGeo = [WebServices getWeatherWithLatitude:nLat AndLongitude:nLng];
    print(NSLog(@"mjsonGeo  = %@",mjsonGeo))
    ObjectResponse *object  = [Parser parseGeoObject];
    Coord *coordObject      = object.coord;
    float lat               = coordObject.lat;
    float lng               = coordObject.lon;
    
    NSString *stName        = object.name;
    
    print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng))
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
