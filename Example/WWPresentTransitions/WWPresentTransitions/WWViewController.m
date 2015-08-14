//
//  WWViewController.m
//  WWPresentTransitions
//
//  Created by zh.wang on 08/14/2015.
//  Copyright (c) 2015 zh.wang. All rights reserved.
//

#import "WWViewController.h"
#import "TransitionAnimation.h"
#import "WWSecondViewController.h"

@interface WWViewController ()<UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) TransitionAnimation *transitionAnimation;

@end

@implementation WWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transitionAnimation = [[TransitionAnimation alloc] initWithPresentAnimationTime:0.25f dismissAnimationTime:0.25f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentSecondViewControllerButtonClicked:(UIButton *)sender
{
    WWSecondViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WWSecondViewController"];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    nav.navigationBar.translucent = NO;
    nav.transitioningDelegate = self;
    [self.transitionAnimation.panAnimation wireToViewController:nav];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.transitionAnimation.presentAnimation;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return self.transitionAnimation.panAnimation.interacting ? self.transitionAnimation.panAnimation : nil;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.transitionAnimation.dismissAnimation;
}
@end
