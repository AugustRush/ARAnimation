//
//  ARValueFunction.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "AREasingCurveFunction.h"
#import "ARAnimatableProperty.h"

typedef id (^ARInterpolation)(id from, id to, CGFloat time, AREasingCurve easing);

ARInterpolation InterpolationForKeyPath(NSString *path);