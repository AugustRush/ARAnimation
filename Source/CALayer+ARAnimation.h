//
//  CALayer+ARAnimation.h
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/23.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@class ARAnimationMaker;
@interface CALayer (ARAnimation)

@property (nonatomic, assign) CGFloat scaleX;
@property (nonatomic, assign) CGFloat scaleY;
@property (nonatomic, assign) CGFloat scale;

@property (nonatomic, assign) CGFloat rotationX;
@property (nonatomic, assign) CGFloat rotationY;
@property (nonatomic, assign) CGFloat rotation;

@end
