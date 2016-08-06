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
/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
}
//----------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnLoadPressed:(id)sender {
    if (![self.txtLatitude.text isEqual:@""] && ![self.txtLongitude.text isEqual:@""]) {
        [self qeueLoadData];
    }
    else {
        self.lblCityValue.text = @"Error, campo vacío";
    }

}
/**********************************************************************************************/
#pragma mark - Task methods
/**********************************************************************************************/
- (void)qeueLoadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    [self.activityLoad startAnimating];
    
    NSOperationQueue *queue         = [NSOperationQueue new];
    NSInvocationOperation *opGet    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    [queue addOperation:opGet];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opGet];
    [queue addOperation:opDidGet];
}
//----------------------------------------------------------------------------------------------
- (void)loadData {
    mjsonGeo                        = [WebServices getWeatherWithLatitude:self.txtLatitude.text AndLongitude:self.txtLongitude.text];
    print(NSLog(@"mjsonGeo  = %@",mjsonGeo))
}
//----------------------------------------------------------------------------------------------
- (void)didLoadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        ObjectResponse *object          = [Parser parseGeoObject];
        Coord *coordObject              = object.coord;
        float lat                       = coordObject.lat;
        float lng                       = coordObject.lon;
        NSString *stName                = object.name;
        
        self.lblCityValue.text          = stName;
        print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng))
        [UIApplication sharedApplication].networkActivityIndicatorVisible   = NO;
        [self.activityLoad stopAnimating];
    });    
}









@end
