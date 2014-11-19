//
//  ViewWithTable.h
//  PharmicaPrototype
//
//  Created by Nick Woodward on 10/27/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewWithTable : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property NSString *titleOfController;
@property NSString *nameOfPlist;
@property NSString *nameOfHeaderCell;
@property NSString *nameOfContentCell;
@property NSInteger *numberOfSections;
@end
