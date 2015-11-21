//
//  ARAnimatableProperty.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARAnimatableProperty.h"

NSString * const kARLayerPosition = @"position";
NSString * const kARLayerPositionX = @"position.x";
NSString * const kARLayerPositionY = @"position.y";
NSString * const kARLayerCornerRadius = @"cornerRadius";
NSString * const kARLayerZPositoin = @"zPosition";
NSString * const kARLayerScaleX = @"transform.scale.x";
NSString * const kARLayerScaleY = @"transform.scale.y";
NSString * const kARLayerScale = @"transform.scale";
NSString * const kARLayerBorderWidth = @"borderWidth";
NSString * const kARLayerBounds = @"bounds";
NSString * const kARLayerBackgroundColor = @"backgroundColor";
NSString * const kARLayerOpacity = @"opacity";
NSString * const kARLayerRotationX = @"transform.rotation.x";
NSString * const kARLayerRotationY = @"transform.rotation.y";
NSString * const kARLayerRotation = @"transform.rotation";
NSString * const kARLayerAnchorPoint = @"anchorPoint";
NSString * const kARShapeLayerStrokeEnd = @"strokeEnd";
NSString * const kARShapeLayerStrokeStart = @"strokeStart";



NSArray *ARAllAnimatablePropertys() {
    return @[@"position",
             @"position.x",
             @"position.y",
             @"cornerRadius",
             @"zPosition",
             @"transform.scale.x",
             @"transform.scale.y",
             @"transform.scale",
             @"borderWidth",
             @"bounds",
             @"backgroundColor",
             @"opacity",
             @"transform.rotation.x",
             @"transform.rotation.y",
             @"transform.rotation",
             @"anchorPoint",
             @"strokeEnd",
             @"strokeStart"];
}

NSString *ARLayerActionEventStoreKey(NSString *event) {
    static NSDictionary *dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{@"position":@"position",
                 @"position.x":@"positionX",
                 @"position.y":@"positionY",
                 @"cornerRadius":@"cornerRadius",
                 @"zPosition":@"zPosition",
                 @"transform.scale.x":@"transform.scale.x",
                 @"transform.scale.y":@"transform.scale.y",
                 @"transform.scale":@"transform.scale",
                 @"borderWidth":@"borderWidth",
                 @"bounds":@"bounds",
                 @"backgroundColor":@"backgroundColor",
                 @"opacity":@"opacity",
                 @"transform.rotation.x":@"transformRotationX",
                 @"transform.rotation.y":@"transformRotationY",
                 @"transform.rotation":@"transformRotation",
                 @"anchorPoint":@"anchorPoint",
                 @"strokeEnd":@"strokeEnd",
                 @"strokeStart":@"strokeStart"};
    });
    
    return dict[event];
}
