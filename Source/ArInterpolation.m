//
//  ARValueFunction.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARInterpolation.h"
#import <UIKit/UIKit.h>

//convenient method for float caculation
CGFloat ARFloatInterpolation(CGFloat from, CGFloat to, CGFloat time, AREasingCurve easing) {
    CGFloat differ = to - from;
    return from + differ * easing(time);
}


ARInterpolation const ARNumberInterpolation = ^NSNumber *(NSNumber *from, NSNumber *to, CGFloat time, AREasingCurve easing) {
    CGFloat f = [from floatValue];
    CGFloat t = [to floatValue];
    CGFloat des = ARFloatInterpolation(f, t, time, easing);
    return [NSNumber numberWithDouble:des];
};

ARInterpolation const ARPointInterpolation = ^NSValue *(NSValue *from, NSValue *to, CGFloat time, AREasingCurve easing) {
    CGPoint f = [from CGPointValue];
    CGPoint t = [to CGPointValue];
    CGFloat desX = ARFloatInterpolation(f.x, t.x, time, easing);
    CGFloat desY = ARFloatInterpolation(f.y, t.y, time, easing);
    CGPoint des = CGPointMake(desX, desY);
    return [NSValue valueWithCGPoint:des];
};

ARInterpolation const ARBoundsInterpolation = ^NSValue *(NSValue *from, NSValue *to, CGFloat time, AREasingCurve easing) {
    CGRect f = [from CGRectValue];
    CGRect t = [to CGRectValue];
    CGFloat desX = ARFloatInterpolation(f.origin.x, t.origin.x, time, easing);
    CGFloat desY = ARFloatInterpolation(f.origin.y, t.origin.y, time, easing);
    CGFloat desW = ARFloatInterpolation(f.size.width, t.size.width, time, easing);
    CGFloat desH = ARFloatInterpolation(f.size.height, t.size.height, time, easing);
    
    CGRect frame = CGRectMake(desX, desY, desW, desH);
    return [NSValue valueWithCGRect:frame];
};

ARInterpolation const ARColorInterpolation = ^id (UIColor *from, UIColor *to, CGFloat time, AREasingCurve easing) {
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
    
    CGFloat desHue = ARFloatInterpolation(fromHue, toHue, time, easing);
    CGFloat desSaturation = ARFloatInterpolation(fromSaturation, toSaturation, time, easing);
    CGFloat desBrightness = ARFloatInterpolation(fromBrightness, toBrightness, time, easing);
    CGFloat desAlpha = ARFloatInterpolation(toAlpha, toAlpha, time, easing);
    
    UIColor *color = [UIColor colorWithHue:desHue saturation:desSaturation brightness:desBrightness alpha:desAlpha];
    return (__bridge id)color.CGColor;
};


ARInterpolation InterpolationForKeyPath(NSString *path) {
    static NSDictionary *dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dict = @{kARLayerCornerRadius:ARNumberInterpolation,
                 kARLayerPositionY:ARNumberInterpolation,
                 kARLayerPositionX:ARNumberInterpolation,
                 kARLayerZPositoin:ARNumberInterpolation,
                 kARLayerScaleY:ARNumberInterpolation,
                 kARLayerScaleX:ARNumberInterpolation,
                 kARLayerScale:ARNumberInterpolation,
                 kARLayerBorderWidth:ARNumberInterpolation,
                 kARLayerPosition:ARPointInterpolation,
                 kARLayerBounds:ARBoundsInterpolation,
                 kARLayerBackgroundColor:ARColorInterpolation,
                 kARLayerOpacity:ARNumberInterpolation,
                 kARLayerRotationX:ARNumberInterpolation,
                 kARLayerRotationY:ARNumberInterpolation,
                 kARLayerRotation:ARNumberInterpolation,
                 kARLayerAnchorPoint:ARPointInterpolation,
                 kARShapeLayerStrokeEnd:ARNumberInterpolation,
                 kARShapeLayerStrokeStart:ARNumberInterpolation};
    });
    return dict[path];
}