//
//  UIView+BIAnimation.h
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/21.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIEasingCurveFunction.h"

@interface UIView (BIAnimation)

//basic
+ (void)bi_animationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;

+ (void)bi_animationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void(^)(void))completion;

+ (void)bi_animationWithDuration:(NSTimeInterval)duration delay:(CFTimeInterval)delay animations:(void (^)(void))animations completion:(void(^)(void))completion;

+ (void)bi_animationWithDuration:(NSTimeInterval)duration delay:(CFTimeInterval)delay easing:(BIEasingCurve)easing animations:(void (^)(void))animations completion:(void (^)(void))completion;

+ (void)bi_animationWithDuration:(NSTimeInterval)duration delay:(CFTimeInterval)delay repeatCount:(NSUInteger)repeatCount autoreverses:(BOOL)autoreverses easing:(BIEasingCurve)easing animations:(void (^)(void))animations completion:(void (^)(void))completion;

//spring
+ (void)bi_springAnimationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations;

+ (void)bi_springAnimationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void(^)(void))completion;

+ (void)bi_springAnimationWithDuration:(NSTimeInterval)duration delay:(CFTimeInterval)delay animations:(void (^)(void))animations completion:(void (^)(void))completion;

+ (void)bi_springAnimationWithDuration:(NSTimeInterval)duration delay:(CFTimeInterval)delay mass:(CGFloat)mass damping:(CGFloat)damping stiffness:(CGFloat)stiffness initialVelocity:(CGFloat)initialVelocity animations:(void (^)(void))animations completion:(void (^)(void))completion;

+ (void)bi_springAnimationWithDuration:(NSTimeInterval)duration delay:(CFTimeInterval)delay repeatCount:(NSUInteger)repeatCount autoreverses:(BOOL)autoreverses mass:(CGFloat)mass damping:(CGFloat)damping stiffness:(CGFloat)stiffness initialVelocity:(CGFloat)initialVelocity animations:(void (^)(void))animations completion:(void (^)(void))completion;

@end
