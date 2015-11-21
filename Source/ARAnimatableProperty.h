//
//  ARAnimatableProperty.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <Foundation/Foundation.h>

//CALayer
FOUNDATION_EXPORT NSString * const kARLayerPosition;
FOUNDATION_EXPORT NSString * const kARLayerPositionX;
FOUNDATION_EXPORT NSString * const kARLayerPositionY;
FOUNDATION_EXPORT NSString * const kARLayerCornerRadius;
FOUNDATION_EXPORT NSString * const kARLayerZPositoin;
FOUNDATION_EXPORT NSString * const kARLayerBorderWidth;
FOUNDATION_EXPORT NSString * const kARLayerScaleX;
FOUNDATION_EXPORT NSString * const kARLayerScaleY;
FOUNDATION_EXPORT NSString * const kARLayerScale;
FOUNDATION_EXPORT NSString * const kARLayerBounds;
FOUNDATION_EXPORT NSString * const kARLayerBackgroundColor;
FOUNDATION_EXPORT NSString * const kARLayerOpacity;
FOUNDATION_EXPORT NSString * const kARLayerRotationX;
FOUNDATION_EXPORT NSString * const kARLayerRotationY;
FOUNDATION_EXPORT NSString * const kARLayerRotation;
FOUNDATION_EXPORT NSString * const kARLayerAnchorPoint;
//CAShapeLayer
FOUNDATION_EXPORT NSString * const kARShapeLayerStrokeEnd;
FOUNDATION_EXPORT NSString * const kARShapeLayerStrokeStart;

NSArray *ARAllAnimatablePropertys();

NSString *ARLayerActionEventStoreKey(NSString *event);



