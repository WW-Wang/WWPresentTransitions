//
//  TransitionAnimation.h
//  Transition
//
//  Created by admin.konnech on 15/7/24.
//  Copyright © 2015年 Konnech Inc'. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PresentAnimation.h"
#import "DismissAnimation.h"
#import "PanGestureRecognizerAnimation.h"

@interface TransitionAnimation : NSObject

@property (strong, nonatomic) PresentAnimation *presentAnimation;
@property (strong, nonatomic) DismissAnimation *dismissAnimation;
@property (strong, nonatomic) PanGestureRecognizerAnimation *panAnimation;

- (instancetype)initWithPresentAnimationTime:(float)presentAnimationTime dismissAnimationTime:(float)dismissAnimationTime;

@end
