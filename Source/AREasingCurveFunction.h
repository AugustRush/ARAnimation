//
//  AREasingCurveFunction.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef CGFloat (^AREasingCurve)(CGFloat timePercentage);

FOUNDATION_EXPORT AREasingCurve const kAREasingCurveLinear;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveQuadratic;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveEaseInCubic;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveEaseOutCubic;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveQuartic;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveSine;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveBackEaseIn;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveBackEaseOut;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveBackEaseInOut;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveBounceOut;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveBounceIn;
FOUNDATION_EXPORT AREasingCurve const kAREasingCurveBounceInOut;