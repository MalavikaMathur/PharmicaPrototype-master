//
//  FormSheetView.m
//  PharmicaPrototype
//
//  Created by Nick Woodward on 10/28/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "FormSheetView.h"
#import "singleton.h"
@interface FormSheetView (){
    NSArray *pickerChoices;
    UITextField *currentlySelectedTextField;
    UIDatePicker *dp;
}

@end

@implementation FormSheetView

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.indexOfData = 0;
    UIPickerView *picker = [[UIPickerView alloc]init];
    dp = [[UIDatePicker alloc]init];
    
    
    //UITextField *tf = (UITextField *)self.tfPickerKeyboard[0];
    pickerChoices = [[NSArray alloc]initWithObjects:@"Choice A",@"Choice B", @"Choice C", nil];
    
    picker.delegate = (id)self;
    picker.dataSource = (id)self;
    
    [dp addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    dp.datePickerMode = UIDatePickerModeDate;
    
    for (UITextField *tf in self.tfPickerKeyboard) {
        tf.delegate = (id)self;
        tf.inputView = picker;
    }
    
    for(UITextField *tf in self.datePicker){
        tf.delegate = (id)self;
        tf.inputView = dp;
    }
    
    //UITextField *tf = self.tfNonPicker[0];
    //tf.text = @"rabbit";
    
    singleton *shared = [singleton sharedManager];
    if(shared.formData.count > self.indexOfData){
        if(shared.formData[self.indexOfData] != nil){
            NSMutableArray *dataForInput = shared.formData[self.indexOfData];
            for(int i = 0;i<[self.tfPickerKeyboard count];i++){
                UITextField *tf = self.tfPickerKeyboard[i];
                tf.text= dataForInput[i];
            }
            for(int i =[self.tfPickerKeyboard count];i<[self.tfPickerKeyboard count]+[self.tfNonPicker count];i++){
                UITextField *tf = self.tfNonPicker[i-[self.tfPickerKeyboard count]];
                tf.text= dataForInput[i];
            }
            for(int i =([self.tfPickerKeyboard count]+[self.tfNonPicker count]);i<[self.tfPickerKeyboard count]+[self.tfNonPicker count]+[self.datePicker count];i++){
                UITextField *tf = self.datePicker[i-[self.tfPickerKeyboard count]-[self.tfNonPicker count]];
                tf.text= dataForInput[i];
            }
            
            /*
            for (NSString *str in shared.pickerData) {
                UITextField *tf = self.tfPickerKeyboard[i];
                tf.text= str;
                i++;
            }
            for (NSString *str in shared.otherData) {
                UITextField *tf = self.tfNonPicker[i];
                tf.text= [str copy];
                i++;
            }
            for (NSString *str in shared.datePickerData) {
                UITextField *tf = self.datePicker[i];
                tf.text= str;
                i++;
            }*/
            NSNumber *segControlValue = dataForInput[[dataForInput count]-1];

            self.segControl.selectedSegmentIndex = [segControlValue integerValue];
        }
    }
}

// let tapping on the background (off the input field) close the thing
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [currentlySelectedTextField resignFirstResponder];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3;
}

-(void)datePickerValueChanged:(UIControlEvents *)event{
    
    currentlySelectedTextField.text = [dp.date description];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return pickerChoices[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    UITextField *tf = currentlySelectedTextField;
    tf.text = pickerChoices[row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    currentlySelectedTextField=textField;
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Submit:(id)sender {
    singleton *shared = [singleton sharedManager];
    NSMutableArray *localData = [NSMutableArray new];
    
    for (UITextField *tf in self.tfPickerKeyboard) {
        [localData addObject:tf.text];
    }
    for (UITextField *tf in self.tfNonPicker) {
        [localData addObject:tf.text];
    }
    for (UITextField *tf in self.datePicker) {
        [localData addObject:tf.text];
    }
    [localData addObject:[[NSNumber alloc]initWithInteger:self.segControl.selectedSegmentIndex]];
    shared.formData[self.indexOfData] = localData;
    /*
    else{
        int i = 0;
        for (UITextField *tf in self.tfPickerKeyboard) {
            shared.pickerData[i] = tf.text;
            i++;
        }
        i=0;
        for (UITextField *tf in self.tfNonPicker) {
            shared.otherData[i] = tf.text;
            i++;
        }
        i=0;
        for (UITextField *tf in self.datePicker) {
            shared.datePickerData[i] = tf.text;
            i++;
        }
    }
    */
    //shared.segmentedControlValue = self.segControl.selected;
    [self.parent reloadTableData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
