//
//  ViewWithTable.m
//  PharmicaPrototype
//
//  Created by Nick Woodward on 10/27/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "ViewWithTable.h"
#import "myTableViewCell.h"

@interface ViewWithTable (){
    NSArray *tableRows;
}

@end

@implementation ViewWithTable

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle* bundle = [NSBundle mainBundle];

    NSString* plistPath = [bundle pathForResource:self.nameOfPlist ofType:@"plist"];
    
    tableRows = [[NSArray alloc] initWithContentsOfFile:plistPath];
    self.lblTitle.text = self.titleOfController;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        if([self.titleOfController isEqualToString:@"Sites And Patients"]){
            return 4;
        }
        return [tableRows count]+1;
    }
    else{
        return 13;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if([self.titleOfController isEqualToString:@"Sites And Patients"]){
        return 2;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.titleOfController isEqualToString:@"Sites And Patients"]){
        myTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:self.nameOfContentCell];
        NSArray *rowData = tableRows[indexPath.row+(indexPath.section *4)];
        cell.firstColumn.text = rowData[0];
        return cell;
    }
    else if (indexPath.row == 0){
        UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:self.nameOfHeaderCell];
        return cell;
    }
    else{
        if([self.titleOfController isEqualToString:@"Studies"]){
            myTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:self.nameOfContentCell];
            return cell;
        }
        /*else if([self.titleOfController isEqualToString:@"Sites And Patients"]){
            myTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:self.nameOfContentCell];
            NSArray *rowData = tableRows[indexPath.row-1];
            cell.firstColumn.text = rowData[0];
            return cell;
        }*/
        else{
            NSArray *rowData = tableRows[indexPath.row-1];
            myTableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:self.nameOfContentCell];
            cell.firstColumn.text = rowData[0];
            //tv.text = rowData[0];
            return cell;
        }
    }

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if([self.titleOfController isEqualToString:@"Sites And Patients"]){
        if(section ==0){
            return @"Program Information";
        }
        else if(section == 1){
            return @"General Study Information";
        }
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
