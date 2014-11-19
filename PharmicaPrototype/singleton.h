//
//  singleton.h
//  PharmicaPrototype
//
//  Created by Malavika Mathuron 10/29/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleton : NSObject
@property NSMutableArray *formData;
@property NSMutableArray *pickerData;
@property NSMutableArray *datePickerData;
@property NSMutableArray *otherData;
@property BOOL segmentedControlValue;
+(id)sharedManager;
@end
