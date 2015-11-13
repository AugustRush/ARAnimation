//
//  BIValueFunction.h
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIEasingCurveFunction.h"
#import "BIAnimatableProperty.h"

typedef id (^BIInterpolation)(id from, id to, CGFloat time, BIEasingCurve easing);

BIInterpolation InterpolationForKeyPath(NSString *path);