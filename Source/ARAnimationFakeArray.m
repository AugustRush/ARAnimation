//
//  ARAnimationLazyArray.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/20.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARAnimationFakeArray.h"

@interface ARAnimationFakeArray ()

@property (nonatomic, assign) NSUInteger fakeCount;
@property (nonatomic, copy) ARInterpolation interpolation;
@property (nonatomic, weak) id from;
@property (nonatomic, weak) id to;
@property (nonatomic, copy) AREasingCurve easing;

@end

@implementation ARAnimationFakeArray

+ (instancetype)arrayWithCount:(NSUInteger)count interpolation:(ARInterpolation)interpolation from:(id)from to:(id)to easing:(AREasingCurve)easing {
    ARAnimationFakeArray *array = [[super alloc] init];
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
