//
//  BIEasingCurveFunction.m
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Cotyright © 2015年 AugustRush. All rights reserved.
//

#import "BIEasingCurveFunction.h"

BIEasingCurve const kBIEasingCurveLinear = ^CGFloat(CGFloat t){
    return t;
};

BIEasingCurve const kBIEasingCurveQuadratic = ^CGFloat(CGFloat t){
    return t * t;
};

BIEasingCurve const kBIEasingCurveCubic = ^CGFloat(CGFloat t){
    return t * t * t;
};

BIEasingCurve const kBIEasingCurveQuartic = ^CGFloat(CGFloat t){
    return t * t * t * t;
};

BIEasingCurve const kBIEasingCurveSine = ^CGFloat(CGFloat t){
    return sin((t - 1) * M_PI_2) + 1;
};

BIEasingCurve const kBIEasingCurveBackEaseIn = ^CGFloat(CGFloat t){
    return t * t * t - t * sin(t * M_PI);
};

BIEasingCurve const kBIEasingCurveBackEaseOut = ^CGFloat(CGFloat t){
    CGFloat f = (1 - t);
    return 1 - (f * f * f - f * sin(f * M_PI));
};

BIEasingCurve const kBIEasingCurveBackEaseInOut = ^CGFloat(CGFloat t){
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

BIEasingCurve const kBIEasingCurveBounceOut = ^CGFloat(CGFloat t){
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

BIEasingCurve const kBIEasingCurveBounceIn = ^CGFloat(CGFloat t){
    return 1 - kBIEasingCurveBounceOut(1 - t);
};

BIEasingCurve const kBIEasingCurveBounceInOut = ^CGFloat(CGFloat t){
    if(t < 0.5)
    {
        return 0.5 * kBIEasingCurveBounceIn(t*2);
    }
    else
    {
        return 0.5 * kBIEasingCurveBounceOut(t * 2 - 1) + 0.5;
    }
};
