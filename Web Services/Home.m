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
    NSDictionary *json = [WebServices getWeatherWithLatitude:nLat AndLongitude:nLng];
    print(NSLog(@"json = %@",json))
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
