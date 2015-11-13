//
//  ARSpringAnimation.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/20.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ARBasicAnimation.h"

@interface ARSpringAnimation : ARBasicAnimation

@property (nonatomic, assign) CGFloat damping;// > 0 default 10
@property (nonatomic, assign) CGFloat mass;// > 0 default 1
@property (nonatomic, assign) CGFloat stiffness;// > 0 deafault 100
@property (nonatomic, assign) CGFloat initialVelocity; //default 0

@end
