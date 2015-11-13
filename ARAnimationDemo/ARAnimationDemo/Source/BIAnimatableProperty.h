//
//  BIAnimatableProperty.h
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString * const kBILayerPosition;
FOUNDATION_EXPORT NSString * const kBILayerPositionX;
FOUNDATION_EXPORT NSString * const kBILayerPositionY;
FOUNDATION_EXPORT NSString * const kBILayerCornerRadius;
FOUNDATION_EXPORT NSString * const kBILayerZPositoin;
FOUNDATION_EXPORT NSString * const kBILayerBorderWidth;
FOUNDATION_EXPORT NSString * const kBILayerScaleX;
FOUNDATION_EXPORT NSString * const kBILayerScaleY;
FOUNDATION_EXPORT NSString * const kBILayerScale;
FOUNDATION_EXPORT NSString * const kBILayerBounds;
FOUNDATION_EXPORT NSString * const kBILayerBackgroundColor;
FOUNDATION_EXPORT NSString * const kBILayerOpacity;
FOUNDATION_EXPORT NSString * const kBILayerRotationX;
FOUNDATION_EXPORT NSString * const kBILayerRotationY;
FOUNDATION_EXPORT NSString * const kBILayerRotation;
FOUNDATION_EXPORT NSString * const kBILayerAnchorPoint;


NSArray *BIAllAnimatablePropertys();

NSString *BILayerActionEventStoreKey(NSString *event);



