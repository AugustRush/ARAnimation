//
//  BIAnimationLazyArray.m
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/20.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIAnimationFakeArray.h"

@interface BIAnimationFakeArray ()

@property (nonatomic, assign) NSUInteger fakeCount;
@property (nonatomic, copy) BIInterpolation interpolation;
@property (nonatomic, weak) id from;
@property (nonatomic, weak) id to;
@property (nonatomic, copy) BIEasingCurve easing;

@end

@implementation BIAnimationFakeArray

+ (instancetype)arrayWithCount:(NSUInteger)count interpolation:(BIInterpolation)interpolation from:(id)from to:(id)to easing:(BIEasingCurve)easing {
    BIAnimationFakeArray *array = [[super alloc] init];
    array->_fakeCount = count;
    array->_interpolation = [interpolation copy];
    array->_easing = [easing copy];
    array->_from = from;
    array->_to = to;
    return array;
}

- (id)objectAtIndex:(NSUInteger)index {
    CGFloat percentage = index * 1.0 / (_fakeCount - 1);
    return _interpolation(_from,_to,percentage,_easing);
}

- (NSUInteger)count {
    return _fakeCount;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[self class] arrayWithCount:_fakeCount interpolation:_interpolation from:_from to:_to easing:_easing];
}


@end
