//
//  BouncePresentAnimation.m
//  Transition
//
//  Created by admin.konnech on 15/7/23.
//  Copyright © 2015年 Konnech Inc'. All rights reserved.
//

#import "PresentAnimation.h"

@interface PresentAnimation()

@property (nonatomic) float animationTime;

@end

@implementation PresentAnimation

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
    // 获取即将进入当前视图的viewcontroller视图的实例
    UIViewController *toVic = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVic = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 设置 即将进入的视图的初始位置（初始frame）
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVic];
    toVic.view.frame = CGRectOffset(finalFrame, screenBounds.size.width, 0);
    
    toVic.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:toVic.view.bounds].CGPath; // 加了此方法 动画卡顿消失
    toVic.view.layer.shadowColor = [UIColor blackColor].CGColor;
    toVic.view.layer.shadowOpacity = 0.6f;
    toVic.view.layer.shadowOffset = CGSizeMake(4, 4);
    toVic.view.layer.shadowRadius = 8.0f;
    
    // 将view添加到containerView中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVic.view];
    
    // 开始动画
    [UIView animateWithDuration:self.animationTime
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         fromVic.view.transform = CGAffineTransformMakeScale(0.96, 0.96);
                         fromVic.view.alpha = 0.6f;
                         
                         toVic.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         fromVic.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                         fromVic.view.alpha = 1.0f;
                         
                         [transitionContext completeTransition:YES];
                     }];
}

@end
