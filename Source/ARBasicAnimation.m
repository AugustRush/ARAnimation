//
//  ARBasicAnimation.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARBasicAnimation.h"
#import "ARAnimatableProperty.h"
#import "ARAnimationFakeArray.h"

@interface ARBasicAnimation ()

@property (nonatomic, copy) ARInterpolation interpolation;

@end

@implementation ARBasicAnimation

+ (instancetype)animationWithKeyPath:(NSString *)path {
    ARBasicAnimation *animation = [super animationWithKeyPath:path];
    animation.easing = kAREasingCurveLinear;
    animation.duration = 0.25;
    animation.interpolation = InterpolationForKeyPath(path);
    return animation;
}

- (NSString *)calculationMode {
    return kCAAnimationLinear;
}

- (NSArray *)values {
    NSUInteger frames = self.duration * 60;
    
    //just create a fake array
    return [ARAnimationFakeArray arrayWithCount:frames interpolation:_interpolation from:_fromValue to:_toValue easing:_easing];
}

- (id)copyWithZone:(NSZone *)zone {
    ARBasicAnimation *copy = [super copyWithZone:zone];
    copy->_fromValue = _fromValue;
    copy->_toValue = _toValue;
    copy->_easing = _easing;
    copy->_interpolation = _interpolation;
    return copy;
}

@end
