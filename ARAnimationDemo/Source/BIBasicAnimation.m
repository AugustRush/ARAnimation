//
//  BIBasicAnimation.m
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIBasicAnimation.h"
#import "BIAnimatableProperty.h"
#import "BIAnimationFakeArray.h"

@interface BIBasicAnimation ()

@property (nonatomic, copy) BIInterpolation interpolation;

@end

@implementation BIBasicAnimation

+ (instancetype)animationWithKeyPath:(NSString *)path {
    BIBasicAnimation *animation = [super animationWithKeyPath:path];
    animation.easing = kBIEasingCurveLinear;
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
    return [BIAnimationFakeArray arrayWithCount:frames interpolation:_interpolation from:_fromValue to:_toValue easing:_easing];
}

- (id)copyWithZone:(NSZone *)zone {
    BIBasicAnimation *copy = [super copyWithZone:zone];
    copy->_fromValue = _fromValue;
    copy->_toValue = _toValue;
    copy->_easing = _easing;
    copy->_interpolation = _interpolation;
    return copy;
}

@end
