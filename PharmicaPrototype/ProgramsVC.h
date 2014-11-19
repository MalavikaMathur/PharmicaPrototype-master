//
//  ProgramsVC.h
//  PharmicaPrototype
//
//  Created by Malavika Mathuron 10/27/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "popoverView.h"

@interface ProgramsVC : UIViewController<parentVC>
- (IBAction)newProgramPressed:(id)sender;
- (IBAction)studiesPressed:(id)sender;

-(void)reloadTableData;
@property (weak, nonatomic) IBOutlet UITableView *tableOfPrograms;
- (IBAction)sitesAndPatientsPressed:(id)sender;

@end
