//
//  ARBasicAnimation.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/19.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "AREasingCurveFunction.h"
#import "ARInterpolation.h"
#import "ARAnimatableProperty.h"

NS_ASSUME_NONNULL_BEGIN
@interface ARBasicAnimation : CAKeyframeAnimation

@property (nonatomic, strong) id fromValue;
@property (nonatomic, strong) id toValue;
@property (nonatomic, copy) AREasingCurve easing;

+ (instancetype)animation NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

@interface ARBasicAnimation (Unavalible)

@property (nonatomic) NSString *calculationMode __attribute__((unavailable("calculationMode cannot be set on ARBasicAnimation")));

- (void)setValues:(NSArray *)values __attribute__((unavailable("values cannot be set on ARBasicAnimation")));

@end

NS_ASSUME_NONNULL_END
