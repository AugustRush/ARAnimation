//
//  BIValueFunction.m
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIInterpolation.h"
#import <UIKit/UIKit.h>

//convenient method for float caculation
CGFloat BIFloatInterpolation(CGFloat from, CGFloat to, CGFloat time, BIEasingCurve easing) {
    CGFloat differ = to - from;
    return from + differ * easing(time);
}


BIInterpolation const BINumberInterpolation = ^NSNumber *(NSNumber *from, NSNumber *to, CGFloat time, BIEasingCurve easing) {
    CGFloat f = [from floatValue];
    CGFloat t = [to floatValue];
    CGFloat des = BIFloatInterpolation(f, t, time, easing);
    return [NSNumber numberWithDouble:des];
};

BIInterpolation const BIPointInterpolation = ^NSValue *(NSValue *from, NSValue *to, CGFloat time, BIEasingCurve easing) {
    CGPoint f = [from CGPointValue];
    CGPoint t = [to CGPointValue];
    CGFloat desX = BIFloatInterpolation(f.x, t.x, time, easing);
    CGFloat desY = BIFloatInterpolation(f.y, t.y, time, easing);
    CGPoint des = CGPointMake(desX, desY);
    return [NSValue valueWithCGPoint:des];
};

BIInterpolation const BIBoundsInterpolation = ^NSValue *(NSValue *from, NSValue *to, CGFloat time, BIEasingCurve easing) {
    CGRect f = [from CGRectValue];
    CGRect t = [to CGRectValue];
    CGFloat desX = BIFloatInterpolation(f.origin.x, t.origin.x, time, easing);
    CGFloat desY = BIFloatInterpolation(f.origin.y, t.origin.y, time, easing);
    CGFloat desW = BIFloatInterpolation(f.size.width, t.size.width, time, easing);
    CGFloat desH = BIFloatInterpolation(f.size.height, t.size.height, time, easing);
    
    CGRect frame = CGRectMake(desX, desY, desW, desH);
    return [NSValue valueWithCGRect:frame];
};

BIInterpolation const BIColorInterpolation = ^id (UIColor *from, UIColor *to, CGFloat time, BIEasingCurve easing) {
    CGFloat fromHue = 0.0f;
    CGFloat fromSaturation = 0.0f;
    CGFloat fromBrightness = 0.0f;
    CGFloat fromAlpha = 0.0f;
    
    [from getHue:&fromHue saturation:&fromSaturation brightness:&fromBrightness alpha:&fromAlpha];
    
    CGFloat toHue = 0.0f;
    CGFloat toSaturation = 0.0f;
    CGFloat toBrightness = 0.0f;
    CGFloat toAlpha = 0.0f;
    
    [to getHue:&toHue saturation:&toSaturation brightness:&toBrightness alpha:&toAlpha];
    
    CGFloat desHue = BIFloatInterpolation(fromHue, toHue, time, easing);
    CGFloat desSaturation = BIFloatInterpolation(fromSaturation, toSaturation, time, easing);
    CGFloat desBrightness = BIFloatInterpolation(fromBrightness, toBrightness, time, easing);
    CGFloat desAlpha = BIFloatInterpolation(toAlpha, toAlpha, time, easing);
    
    UIColor *color = [UIColor colorWithHue:desHue saturation:desSaturation brightness:desBrightness alpha:desAlpha];
    return (__bridge id)color.CGColor;
};


BIInterpolation InterpolationForKeyPath(NSString *path) {
    static NSDictionary *dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{kBILayerCornerRadius:BINumberInterpolation,
                 kBILayerPositionY:BINumberInterpolation,
                 kBILayerPositionX:BINumberInterpolation,
                 kBILayerZPositoin:BINumberInterpolation,
                 kBILayerScaleY:BINumberInterpolation,
                 kBILayerScaleX:BINumberInterpolation,
                 kBILayerScale:BINumberInterpolation,
                 kBILayerBorderWidth:BINumberInterpolation,
                 kBILayerPosition:BIPointInterpolation,
                 kBILayerBounds:BIBoundsInterpolation,
                 kBILayerBackgroundColor:BIColorInterpolation,
                 kBILayerOpacity:BINumberInterpolation,
                 kBILayerRotationX:BINumberInterpolation,
                 kBILayerRotationY:BINumberInterpolation,
                 kBILayerRotation:BINumberInterpolation,
                 kBILayerAnchorPoint:BIPointInterpolation};
    });
    return dict[path];
}