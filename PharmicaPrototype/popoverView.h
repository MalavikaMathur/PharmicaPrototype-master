//
//  popoverView.h
//  PharmicaPrototype
//
//  Created by Nick Woodward on 10/27/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol parentVC <NSObject>

-(void)setSegueFlag:(NSString *)flagName;

@end

@interface popoverView : UITableViewController

@property id<parentVC> parent;

@end
