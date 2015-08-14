//
//  TransitionAnimation.m
//  Transition
//
//  Created by admin.konnech on 15/7/24.
//  Copyright © 2015年 Konnech Inc'. All rights reserved.
//

#import "TransitionAnimation.h"

@implementation TransitionAnimation

- (instancetype)initWithPresentAnimationTime:(float)presentAnimationTime dismissAnimationTime:(float)dismissAnimationTime
{
    self = [super init];
    if (self) {
        self.presentAnimation = [[PresentAnimation alloc] initWithAnimationTime:presentAnimationTime];
        self.dismissAnimation = [[DismissAnimation alloc] initWithAnimationTime:dismissAnimationTime];
        self.panAnimation = [[PanGestureRecognizerAnimation alloc] init];
    }
    return self;
}

@end
