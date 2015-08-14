//
//  BouncePresentAnimation.h
//  Transition
//
//  Created by admin.konnech on 15/7/23.
//  Copyright © 2015年 Konnech Inc'. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithAnimationTime:(float)animationTime;

@end
