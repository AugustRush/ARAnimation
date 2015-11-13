//
//  ARAnimationLazyArray.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/20.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARInterpolation.h"

/**
 *  @brief  use for ARAnimation lazy calulate
 */
@interface ARAnimationFakeArray : NSArray

+ (instancetype)arrayWithCount:(NSUInteger)count
                 interpolation:(ARInterpolation)interpolation
                          from:(id)from
                            to:(id)to
                        easing:(AREasingCurve)easing;


@end
