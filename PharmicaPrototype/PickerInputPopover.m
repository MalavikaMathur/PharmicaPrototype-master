//
//  PickerInputPopover.m
//  PharmicaPrototype
//
//  Created by Malavika Mathuron 10/28/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "PickerInputPopover.h"

@interface PickerInputPopover ()

@end

@implementation PickerInputPopover

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    return @"abcdefg";
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return 3;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ok:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
