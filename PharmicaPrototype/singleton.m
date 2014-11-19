//
//  singleton.m
//  PharmicaPrototype
//
//  Created by Malavika Mathuron 10/29/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "singleton.h"

@implementation singleton


+ (id)sharedManager {
    static singleton *sharedMyManager = nil;
    if (sharedMyManager == nil){
        sharedMyManager = [[self alloc] init];
        sharedMyManager.formData = [NSMutableArray new];
        sharedMyManager.otherData = [NSMutableArray new];
        sharedMyManager.pickerData = [NSMutableArray new];
        sharedMyManager.datePickerData = [NSMutableArray new];
    }
    return sharedMyManager;
}

@end
