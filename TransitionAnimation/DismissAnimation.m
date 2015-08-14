//
//  NormalDismissAnimation.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "DismissAnimation.h"

@interface DismissAnimation()

@property (nonatomic) float animationTime;

@end

@implementation DismissAnimation

- (instancetype)initWithAnimationTime:(float)animationTime
{
    self = [super init];
    if (self) {
        self.animationTime = animationTime;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.animationTime;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];   // second view controller
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];       // view controller
    
    // 2. Set init frame for fromVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, screenBounds.size.width, 0);
    
    // 3. Add target view to the container, and move it to back.
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];

    // 4. Do animate now
    toVC.view.transform = CGAffineTransformMakeScale(0.96, 0.96);
    toVC.view.alpha = 0.6f;
    [UIView animateWithDuration:self.animationTime
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromVC.view.frame = finalFrame;
                         
                         toVC.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         toVC.view.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}

@end
