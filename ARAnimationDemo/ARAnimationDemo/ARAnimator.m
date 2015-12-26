//
//  ARAnimator.m
//  ARAnimationDemo
//
//  Created by AugustRush on 12/26/15.
//  Copyright © 2015 AugustRush. All rights reserved.
//

#import "ARAnimator.h"

@implementation ARAnimator
{
}

+ (instancetype)shareAnimator {
    static ARAnimator *animator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        animator = [[ARAnimator alloc] init];
    });
    return animator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)addAnimation:(ARCustomAnimation *)animation {

}

@end
