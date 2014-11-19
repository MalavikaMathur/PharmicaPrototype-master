//
//  ViewController.m
//  PharmicaPrototype
//
//  Created by Malavika Mathuron 10/23/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*- (BOOL) shouldAutorotate
{
    return NO;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{

    return UIInterfaceOrientationPortrait;
}*/

/*- (void)updateViewConstraints {
    [super updateViewConstraints];
    self.topRowVertical.constant =300;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //self.btnPrograms.bounds = CGRectMake(400.0, 400.0, 126.0, 93.5);
    self.topRowVertical.constant = 300.0;
    [self.navigationController.topViewController.view setNeedsUpdateConstraints];
    [self.navigationController.topViewController.view updateConstraintsIfNeeded];
    [self.navigationController.topViewController.view setNeedsLayout];
    [self.navigationController.topViewController.view layoutIfNeeded];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
