//
//  ReportsTableVIew.m
//  PharmicaPrototype
//
//  Created by Nick Woodward on 10/30/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "ReportsTableVIew.h"

@interface ReportsTableVIew ()

@end

@implementation ReportsTableVIew

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 4){
        NSURL *URL = [[NSBundle mainBundle] URLForResource:@"site performance" withExtension:@"pdf"];
        
        // Initialize Document Interaction Controller
        UIDocumentInteractionController  *documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:(id)self];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];

    }
    else if(indexPath.row == 3){
        NSURL *URL = [[NSBundle mainBundle] URLForResource:@"SITE STARTUP AND DATES REPORTS" withExtension:@"pdf"];
        
        // Initialize Document Interaction Controller
        UIDocumentInteractionController  *documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:(id)self];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];
        
    }
    else if(indexPath.row == 2){
        NSURL *URL = [[NSBundle mainBundle] URLForResource:@"study startup graph" withExtension:@"pdf"];
        
        // Initialize Document Interaction Controller
        UIDocumentInteractionController  *documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:(id)self];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];
        
    }
    else if(indexPath.row == 1){
        NSURL *URL = [[NSBundle mainBundle] URLForResource:@"SiteStartupStatus" withExtension:@"pdf"];
        
        // Initialize Document Interaction Controller
        UIDocumentInteractionController  *documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:(id)self];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];
        
    }
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
    return self;
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}*/

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
