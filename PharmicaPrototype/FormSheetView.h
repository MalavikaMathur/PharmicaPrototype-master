//
//  FormSheetView.h
//  PharmicaPrototype
//
//  Created by Nick Woodward on 10/28/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgramsVC.h"

@interface FormSheetView : UIViewController
@property NSInteger indexOfData;

@property ProgramsVC *parent;

- (IBAction)Submit:(id)sender;
- (IBAction)cancel:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *tfPickerKeyboard;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *tfNonPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *datePicker;


@end
