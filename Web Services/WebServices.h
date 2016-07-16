//
//  WebServices.h
//  Web Services
//
//  Created by Walter Gonzalez Domenzain on 15/07/16.
//  Copyright © 2016 UAG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject
+ (NSDictionary *)getWeatherWithLatitude:(NSString *)latitude AndLongitude:(NSString*)longitude;
+ (NSDictionary*) sendPost:(NSString*)postUrl forData:(NSString *)data andMode:(BOOL)mode;
@end
