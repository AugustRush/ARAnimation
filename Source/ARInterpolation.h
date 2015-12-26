//
//  ARValueFunction.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "AREasingCurveFunction.h"
#import "ARAnimatableProperty.h"
/**
 *  @brief an interpolation block for caculate animation process value
 *
 *  @param from   from value
 *  @param to     to value
 *  @param time   current time (0-1)
 *  @param easing animation easing curve
 *
 *  @return process value
 */
typedef id (^ARInterpolation)(id from, id to, CGFloat time, AREasingCurve easing);

/**
 *  @brief  get the special interpolation for keyPath
 *
 *  @param path animatable keyPath of ARAnimation
 *
 *  @return the Interpolation
 */
ARInterpolation InterpolationForKeyPath(NSString *path);