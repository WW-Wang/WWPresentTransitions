//
//  PanGestureRecognizerAnimation.h
//  Transition
//
//  Created by admin.konnech on 15/7/24.
//  Copyright © 2015年 Konnech Inc'. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanGestureRecognizerAnimation : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;

@end
