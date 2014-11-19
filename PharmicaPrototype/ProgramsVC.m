//
//  ProgramsVC.m
//  PharmicaPrototype
//
//  Created by Malavika Mathuron 10/27/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "ProgramsVC.h"
#import "popoverView.h"
#import "ViewWithTable.h"
#import "singleton.h"
#import "FormSheetView.h"

@interface ProgramsVC ()

@end

@implementation ProgramsVC{
    NSString *segueFlag;
    popoverView *pop;
    NSNumber *indexToDisplay;
}

-(void)reloadTableData{
    [self.tableOfPrograms reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    segueFlag = nil;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    if([segueFlag isEqualToString:@"go"]){
        segueFlag = nil;
        //[self performSegueWithIdentifier:@"toTable" sender:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    singleton *shared = [singleton sharedManager];
    
    return [shared.formData count];//[tableRows count]+1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    indexToDisplay = [[NSNumber alloc]initWithInteger:indexPath.row];
    [self performSegueWithIdentifier:@"showForm" sender:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    singleton *shared = [singleton sharedManager];
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"program"];
    NSMutableArray *getNameArray = shared.formData[indexPath.row];
    
    NSString *nameOfCell = getNameArray[8];
    
    cell.textLabel.text = nameOfCell;
    return cell;
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"toPopover"]){
        pop =[segue destinationViewController];
        pop.parent = self;
    }
    else if([[segue identifier]isEqualToString:@"toTable"]){
        ViewWithTable *vwt = [segue destinationViewController];
        vwt.titleOfController = segueFlag;
        
        if([segueFlag isEqualToString:@"Regulatory Milestones"]){
            vwt.nameOfPlist = @"ProgramsRegulatoryMilestones";
            vwt.nameOfHeaderCell = @"milestonesHeader";
            vwt.nameOfContentCell = @"milestonesContent";
        }
        else if([segueFlag isEqualToString:@"Clinical Milestones"]){
            vwt.nameOfPlist = @"ProgramsClinicalMilestones";
            vwt.nameOfHeaderCell = @"milestonesHeader";
            vwt.nameOfContentCell = @"milestonesContent";
        }
        else if([segueFlag isEqualToString:@"Studies"]){
            vwt.nameOfPlist = @"ProgramsClinicalMilestones";
            vwt.nameOfHeaderCell = @"studiesHeader";
            vwt.nameOfContentCell = @"studiesContent";
        }
        else if([segueFlag isEqualToString:@"Sites And Patients"]){
            vwt.nameOfPlist = @"SitesAndPatients";
            vwt.nameOfHeaderCell = @"sitesContent";
            vwt.nameOfContentCell = @"sitesContent";
        }
    }
    else{
        FormSheetView *vc = [segue destinationViewController];
        vc.modalPresentationStyle = UIModalPresentationFormSheet;
        vc.parent = self;
        singleton *shared = [singleton sharedManager];
        if(indexToDisplay == nil){
            vc.indexOfData = [shared.formData count];
        }
        else{
            vc.indexOfData = [indexToDisplay integerValue];
        }
        indexToDisplay = nil;
        //UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 200, 50)];
        //testLabel.text = @"IFNWIFIWIFH";
        //[vc.view addSubview:testLabel];
        
    }
}
-(void)setSegueFlag:(NSString *)flagName{
    segueFlag = flagName;
    [pop dismissViewControllerAnimated:NO completion:nil];
    [self performSegueWithIdentifier:@"toTable" sender:nil];

}

- (IBAction)newProgramPressed:(id)sender {
}

- (IBAction)studiesPressed:(id)sender {
    segueFlag = @"Studies";
    [self performSegueWithIdentifier:@"toTable" sender:nil];
}
- (IBAction)sitesAndPatientsPressed:(id)sender {
    segueFlag = @"Sites And Patients";
    [self performSegueWithIdentifier:@"toTable" sender:nil];

}
@end
