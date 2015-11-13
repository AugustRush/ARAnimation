//
//  CALayer+ARAnimation.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/23.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "CALayer+ARAnimation.h"
#import <objc/runtime.h>

#import "ARAnimatableProperty.h"

@implementation CALayer (ARAnimation)

@dynamic scaleX;
@dynamic scaleY;
@dynamic scale;
@dynamic rotationX;
@dynamic rotationY;
@dynamic rotation;

- (void)setScaleX:(CGFloat)scaleX {
    [self setValue:@(scaleX) forKeyPath:kARLayerScaleX];
}

- (void)setScaleY:(CGFloat)scaleY {
    [self setValue:@(scaleY) forKeyPath:kARLayerScaleY];
}

- (void)setScale:(CGFloat)scale {
    [self setValue:@(scale) forKeyPath:kARLayerScale];
}

- (void)setRotationX:(CGFloat)rotationX {
    [self setValue:@(rotationX) forKey:ARLayerActionEventStoreKey(kARLayerRotationX)];
    [self setValue:@(rotationX) forKeyPath:kARLayerRotationX];
}

- (void)setRotationY:(CGFloat)rotationY {
    [self setValue:@(rotationY) forKey:ARLayerActionEventStoreKey(kARLayerRotationY)];
    [self setValue:@(rotationY) forKeyPath:kARLayerRotationY];
}

- (void)setRotation:(CGFloat)rotation {
    [self setValue:@(rotation) forKey:ARLayerActionEventStoreKey(kARLayerRotation)];
    [self setValue:@(rotation) forKeyPath:kARLayerRotation];
}

@end
