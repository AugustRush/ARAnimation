//
//  AREasingCurveFunction.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Cotyright © 2015年 AugustRush. All rights reserved.
//

#import "AREasingCurveFunction.h"

AREasingCurve const kAREasingCurveLinear = ^CGFloat(CGFloat t){
    return t;
};

AREasingCurve const kAREasingCurveQuadratic = ^CGFloat(CGFloat t){
    return t * t;
};

AREasingCurve const kAREasingCurveEaseInCubic = ^CGFloat(CGFloat t){
    return t * t * t;
};

AREasingCurve const kAREasingCurveEaseOutCubic = ^CGFloat(CGFloat t){
    return pow(t - 1, 3) + 1;;
};

AREasingCurve const kAREasingCurveQuartic = ^CGFloat(CGFloat t){
    return t * t * t * t;
};

AREasingCurve const kAREasingCurveSine = ^CGFloat(CGFloat t){
    return sin((t - 1) * M_PI_2) + 1;
};

AREasingCurve const kAREasingCurveBackEaseIn = ^CGFloat(CGFloat t){
    return t * t * t - t * sin(t * M_PI);
};

AREasingCurve const kAREasingCurveBackEaseOut = ^CGFloat(CGFloat t){
    CGFloat f = (1 - t);
    return 1 - (f * f * f - f * sin(f * M_PI));
};

AREasingCurve const kAREasingCurveBackEaseInOut = ^CGFloat(CGFloat t){
    if(t < 0.5)
    {
        CGFloat f = 2 * t;
        return 0.5 * (f * f * f - f * sin(f * M_PI));
    }
    else
    {
        CGFloat f = (1 - (2*t - 1));
        return 0.5 * (1 - (f * f * f - f * sin(f * M_PI))) + 0.5;
    }
};

AREasingCurve const kAREasingCurveBounceOut = ^CGFloat(CGFloat t){
    if(t < 4/11.0){
        return (121 * t * t)/16.0;
    } else if(t < 8/11.0){
        return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
    }else if(t < 9/10.0){
        return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
    }else{
        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
    }
};

AREasingCurve const kAREasingCurveBounceIn = ^CGFloat(CGFloat t){
    return 1 - kAREasingCurveBounceOut(1 - t);
};

AREasingCurve const kAREasingCurveBounceInOut = ^CGFloat(CGFloat t){
    if(t < 0.5)
    {
        return 0.5 * kAREasingCurveBounceIn(t*2);
    }
    else
    {
        return 0.5 * kAREasingCurveBounceOut(t * 2 - 1) + 0.5;
    }
};
