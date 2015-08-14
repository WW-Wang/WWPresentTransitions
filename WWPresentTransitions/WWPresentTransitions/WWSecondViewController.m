//
//  WWSecondViewController.m
//  WWPresentTransitions
//
//  Created by zh.wang on 15/8/14.
//  Copyright (c) 2015年 zh.wang. All rights reserved.
//

#import "WWSecondViewController.h"

@interface WWSecondViewController ()

@end

@implementation WWSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonClicked:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
