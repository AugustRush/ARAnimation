//
//  CALayer+BIAnimation.m
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/23.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "CALayer+BIAnimation.h"
#import "BIAnimationMaker.h"
#import <objc/runtime.h>

#import "BIAnimatableProperty.h"

@implementation CALayer (BIAnimation)

@dynamic scaleX;
@dynamic scaleY;
@dynamic scale;
@dynamic rotationX;
@dynamic rotationY;
@dynamic rotation;

- (void)setScaleX:(CGFloat)scaleX {
    [self setValue:@(scaleX) forKeyPath:kBILayerScaleX];
}

- (void)setScaleY:(CGFloat)scaleY {
    [self setValue:@(scaleY) forKeyPath:kBILayerScaleY];
}

- (void)setScale:(CGFloat)scale {
    [self setValue:@(scale) forKeyPath:kBILayerScale];
}

- (void)setRotationX:(CGFloat)rotationX {
    [self setValue:@(rotationX) forKey:BILayerActionEventStoreKey(kBILayerRotationX)];
    [self setValue:@(rotationX) forKeyPath:kBILayerRotationX];
}

- (void)setRotationY:(CGFloat)rotationY {
    [self setValue:@(rotationY) forKey:BILayerActionEventStoreKey(kBILayerRotationY)];
    [self setValue:@(rotationY) forKeyPath:kBILayerRotationY];
}

- (void)setRotation:(CGFloat)rotation {
    [self setValue:@(rotation) forKey:BILayerActionEventStoreKey(kBILayerRotation)];
    [self setValue:@(rotation) forKeyPath:kBILayerRotation];
}

@end
