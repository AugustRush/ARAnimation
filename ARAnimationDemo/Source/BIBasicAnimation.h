//
//  BIBasicAnimation.h
//  BIAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "BIEasingCurveFunction.h"
#import "BIInterpolation.h"
#import "BIAnimatableProperty.h"

NS_ASSUME_NONNULL_BEGIN
@interface BIBasicAnimation : CAKeyframeAnimation

@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;
@property (nonatomic, copy) BIEasingCurve easing;

+ (instancetype)animation NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

@interface BIBasicAnimation (Unavalible)

@property (nonatomic) NSString *calculationMode __attribute__((unavailable("calculationMode cannot be set on BIBasicAnimation")));

- (void)setValues:(NSArray *)values __attribute__((unavailable("values cannot be set on BIBasicAnimation")));

@end

NS_ASSUME_NONNULL_END
