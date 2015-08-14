//
//  PanGestureRecognizerAnimation.m
//  Transition
//
//  Created by admin.konnech on 15/7/24.
//  Copyright © 2015年 Konnech Inc'. All rights reserved.
//

#import "PanGestureRecognizerAnimation.h"

@interface PanGestureRecognizerAnimation()

@property (assign, nonatomic) BOOL shouldComplete;
@property (strong, nonatomic) UIViewController *pushingVC;

@end

@implementation PanGestureRecognizerAnimation

- (void)wireToViewController:(UIViewController *)viewController
{
    self.pushingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView *)view
{
    UIScreenEdgePanGestureRecognizer *gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    [gesture setEdges:UIRectEdgeLeft];
    [view addGestureRecognizer:gesture];
}

- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view.superview];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.pushingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            CGFloat fraction = translation.x / CGRectGetWidth(gesture.view.superview.bounds);
            self.shouldComplete = (fraction > 0.45);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (!self.shouldComplete || gesture.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end
