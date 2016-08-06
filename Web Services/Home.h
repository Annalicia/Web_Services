//
//  ViewController.h
//  Web Services
//
//  Created by Walter Gonzalez Domenzain on 15/07/16.
//  Copyright © 2016 UAG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"


@interface Home : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnLoad;
@property (strong, nonatomic) IBOutlet UILabel *lblCityValue;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityLoad;

- (IBAction)btnLoadPressed:(id)sender;

@end

