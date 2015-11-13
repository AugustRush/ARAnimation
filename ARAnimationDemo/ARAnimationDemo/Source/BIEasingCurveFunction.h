//
//  BIEasingCurveFunction.h
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef CGFloat (^BIEasingCurve)(CGFloat timePercentage);

FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveLinear;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveQuadratic;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveCubic;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveQuartic;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveSine;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveBackEaseIn;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveBackEaseOut;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveBackEaseInOut;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveBounceOut;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveBounceIn;
FOUNDATION_EXPORT BIEasingCurve const kBIEasingCurveBounceInOut;