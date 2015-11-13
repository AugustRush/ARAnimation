//
//  BIAnimationLazyArray.h
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/20.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIInterpolation.h"

/**
 *  @brief  use for BIAnimation lazy calulate
 */
@interface BIAnimationFakeArray : NSArray

+ (instancetype)arrayWithCount:(NSUInteger)count
                 interpolation:(BIInterpolation)interpolation
                          from:(id)from
                            to:(id)to
                        easing:(BIEasingCurve)easing;


@end
