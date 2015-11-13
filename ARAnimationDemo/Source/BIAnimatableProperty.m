//
//  BIAnimatableProperty.m
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIAnimatableProperty.h"

NSString * const kBILayerPosition = @"position";
NSString * const kBILayerPositionX = @"position.x";
NSString * const kBILayerPositionY = @"position.y";
NSString * const kBILayerCornerRadius = @"cornerRadius";
NSString * const kBILayerZPositoin = @"zPosition";
NSString * const kBILayerScaleX = @"transform.scale.x";
NSString * const kBILayerScaleY = @"transform.scale.y";
NSString * const kBILayerScale = @"transform.scale";
NSString * const kBILayerBorderWidth = @"borderWidth";
NSString * const kBILayerBounds = @"bounds";
NSString * const kBILayerBackgroundColor = @"backgroundColor";
NSString * const kBILayerOpacity = @"opacity";
NSString * const kBILayerRotationX = @"transform.rotation.x";
NSString * const kBILayerRotationY = @"transform.rotation.y";
NSString * const kBILayerRotation = @"transform.rotation";
NSString * const kBILayerAnchorPoint = @"anchorPoint";


NSArray *BIAllAnimatablePropertys() {
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
             @"anchorPoint"];
}

NSString *BILayerActionEventStoreKey(NSString *event) {
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
                 @"anchorPoint":@"anchorPoint"};
    });
    
    return dict[event];
}
