//
//  ARSpringAnimation.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/20.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARSpringAnimation.h"

@implementation ARSpringAnimation

+ (instancetype)animationWithKeyPath:(NSString *)path {
    ARSpringAnimation *animation = [super animationWithKeyPath:path];
    animation.damping = 10;
    animation.initialVelocity = 0;
    animation.stiffness = 100;
    animation.mass = 1;
    animation.easing = [animation easing];

    return animation;
}

- (NSString *)calculationMode {
    return kCAAnimationLinear;
}

- (AREasingCurve)easing {
    
    CGFloat b = self.damping;
    CGFloat m = self.mass;
    CGFloat k = self.stiffness;
    CGFloat v0 = self.initialVelocity;
    
    NSParameterAssert(m > 0);
    NSParameterAssert(k > 0);
    NSParameterAssert(b > 0);
    
    CGFloat beta = b / (2 * m);
    CGFloat omega0 = sqrtf(k / m);
    CGFloat omega1 = sqrtf((omega0 * omega0) - (beta * beta));
    CGFloat omega2 = sqrtf((beta * beta) - (omega0 * omega0));
    
    CGFloat x0 = -1;

    if (beta > omega0)
        beta = omega0;
    
    CGFloat (^oscillation)(CGFloat);
    if (beta < omega0) {
        // Underdamped
        oscillation = ^(CGFloat t) {
            CGFloat envelope = expf(-beta * t);
            
            return -x0 + envelope * (x0 * cosf(omega1 * t) + ((beta * x0 + v0) / omega1) * sinf(omega1 * t));
        };
    } else if (beta == omega0) {
        // Critically damped
        oscillation = ^(CGFloat t) {
            CGFloat envelope = expf(-beta * t);
            
            return -x0 + envelope * (x0 + (beta * x0 + v0) * t);
        };
    } else {
        // Overdamped
        oscillation = ^(CGFloat t) {
            CGFloat envelope = expf(-beta * t);
            
            return -x0 + envelope * (x0 * coshf(omega2 * t) + ((beta * x0 + v0) / omega2) * sinhf(omega2 * t));
        };
    }
    
    return oscillation;
}

- (id)copyWithZone:(NSZone *)zone {
    ARSpringAnimation *copy = [super copyWithZone:zone];
    copy->_damping = _damping;
    copy->_stiffness = _stiffness;
    copy->_mass = _mass;
    copy->_initialVelocity = _initialVelocity;
    copy.easing = self.easing;
    return copy;
}

@end
