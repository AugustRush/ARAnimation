//
//  UIView+ARAnimation.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/10/21.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "UIView+ARAnimation.h"
#import <objc/runtime.h>
#import "ARBasicAnimation.h"
#import "ARSpringAnimation.h"

static void *AR_currentAnimationContext = NULL;
static void *AR_animationContext = &AR_animationContext;

NSString *const kARBlockAnimationContextKey = @"kARBlockAnimationContextKey";

/**
 *  @brief  info
 */
@interface ARAnimationInfo : NSObject

@property(nonatomic, weak) CALayer *layer;
@property(nonatomic, copy) NSString *event;
@property(nonatomic, strong) id fromValue;

@end

@implementation ARAnimationInfo

@end

/**
 *  @brief  context
 */
@interface ARBlockAnimationContext : NSObject

@property(nonatomic, assign) CFTimeInterval delay;
@property(nonatomic, strong, readonly)
    NSMutableArray<ARAnimationInfo *> *animationInfos;

@end

@implementation ARBlockAnimationContext

- (instancetype)init {
  self = [super init];
  if (self) {
    _animationInfos = [NSMutableArray array];
  }
  return self;
}

@end

@implementation UIView (ARAnimation)

#pragma mark - swizzle methods

+ (void)initialize {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [self swizzleMethods];
  });
}

+ (void)swizzleMethods {
  SEL originalSelector = @selector(actionForLayer:forKey:);
  SEL extendedSelector = @selector(AR_actionForLayer:forKey:);

  Method originalMethod = class_getInstanceMethod(self, originalSelector);
  Method extendedMethod = class_getInstanceMethod(self, extendedSelector);

  if (class_addMethod(self, originalSelector,
                      method_getImplementation(extendedMethod),
                      method_getTypeEncoding(extendedMethod))) {
    class_replaceMethod(self, extendedSelector,
                        method_getImplementation(originalMethod),
                        method_getTypeEncoding(originalMethod));
  } else {
    method_exchangeImplementations(originalMethod, extendedMethod);
  }
}

- (id<CAAction>)AR_actionForLayer:(CALayer *)layer forKey:(NSString *)event {
  if (AR_currentAnimationContext == AR_animationContext) {
    //        NSLog(@"event is %@",event);
    if ([ARAllAnimatablePropertys() containsObject:event]) {
      ARBlockAnimationContext *context =
          [CATransaction valueForKey:kARBlockAnimationContextKey];
      ARAnimationInfo *info = [[ARAnimationInfo alloc] init];
      info.layer = layer;
      info.event = event;
      if ([event isEqualToString:kARLayerBackgroundColor]) {
        CGColorRef from = (__bridge CGColorRef)([layer valueForKeyPath:event]);
        info.fromValue = [UIColor colorWithCGColor:from];
      } else {
        info.fromValue = [layer valueForKeyPath:event];
      }

      [context.animationInfos addObject:info];
    }

    return (id<CAAction>)[NSNull null];
  }

  return [self AR_actionForLayer:layer forKey:event];
}

#pragma mark - public methods

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                      animations:(void (^)(void))animations {
  [self AR_animationWithDuration:duration animations:animations completion:nil];
}

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion {
  [self AR_animationWithDuration:duration
                           delay:0
                      animations:animations
                      completion:completion];
}

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                           delay:(CFTimeInterval)delay
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion {
  [self AR_animationWithDuration:duration
                           delay:delay
                          easing:kAREasingCurveLinear
                      animations:animations
                      completion:completion];
}

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                           delay:(CFTimeInterval)delay
                          easing:(AREasingCurve)easing
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion {
  [self AR_animationWithDuration:duration
                           delay:delay
                     repeatCount:0
                    autoreverses:NO
                          easing:easing
                      animations:animations
                      completion:completion];
}

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                           delay:(CFTimeInterval)delay
                     repeatCount:(NSUInteger)repeatCount
                    autoreverses:(BOOL)autoreverses
                          easing:(AREasingCurve)easing
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion {
  [CATransaction lock];
  [CATransaction begin];
  [CATransaction setDisableActions:NO];
  [CATransaction setCompletionBlock:completion];

  AR_currentAnimationContext = AR_animationContext;
  ARBlockAnimationContext *context = [[ARBlockAnimationContext alloc] init];
  context.delay = delay;
  [CATransaction setValue:context forKey:kARBlockAnimationContextKey];
  animations();
  AR_currentAnimationContext = NULL;
  [self addBasicAnimationsWithContext:context
                               easing:easing
                             duration:duration
                          repeatCount:repeatCount
                         autoreverses:autoreverses];

  [CATransaction commit];
  [CATransaction unlock];
}

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                            animations:(void (^)(void))animations {
  [self AR_springAnimationWithDuration:duration
                            animations:animations
                            completion:nil];
}

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion {
  [self AR_springAnimationWithDuration:duration
                                 delay:0.0
                            animations:animations
                            completion:completion];
}

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                                 delay:(CFTimeInterval)delay
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion {
  [self AR_springAnimationWithDuration:duration
                                 delay:delay
                                  mass:1
                               damping:10
                             stiffness:100
                       initialVelocity:0
                            animations:animations
                            completion:completion];
}

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                                 delay:(CFTimeInterval)delay
                                  mass:(CGFloat)mass
                               damping:(CGFloat)damping
                             stiffness:(CGFloat)stiffness
                       initialVelocity:(CGFloat)initialVelocity
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion {
  [self AR_springAnimationWithDuration:duration
                                 delay:delay
                           repeatCount:0
                          autoreverses:NO
                                  mass:mass
                               damping:damping
                             stiffness:stiffness
                       initialVelocity:initialVelocity
                            animations:animations
                            completion:completion];
}

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                                 delay:(CFTimeInterval)delay
                           repeatCount:(NSUInteger)repeatCount
                          autoreverses:(BOOL)autoreverses
                                  mass:(CGFloat)mass
                               damping:(CGFloat)damping
                             stiffness:(CGFloat)stiffness
                       initialVelocity:(CGFloat)initialVelocity
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion {
  [CATransaction lock];
  [CATransaction begin];
  [CATransaction setDisableActions:NO];
  [CATransaction setCompletionBlock:completion];

  AR_currentAnimationContext = AR_animationContext;
  ARBlockAnimationContext *context = [[ARBlockAnimationContext alloc] init];
  context.delay = delay;
  [CATransaction setValue:context forKey:kARBlockAnimationContextKey];
  animations();
  AR_currentAnimationContext = NULL;
  [self addSpringAnimationsWithContext:context
                              duration:duration
                                  mass:mass
                               damping:damping
                             stiffness:stiffness
                       initialVelocity:initialVelocity
                           repeatCount:repeatCount
                          autoreverses:autoreverses];

  [CATransaction commit];
  [CATransaction unlock];
}

#pragma mark - private methods

+ (void)addBasicAnimationsWithContext:(ARBlockAnimationContext *)context
                               easing:(AREasingCurve)easing
                             duration:(CFTimeInterval)duration
                          repeatCount:(NSUInteger)repeatCount
                         autoreverses:(BOOL)autoreverses {
  [context.animationInfos
      enumerateObjectsUsingBlock:^(ARAnimationInfo *_Nonnull info,
                                   NSUInteger idx, BOOL *_Nonnull stop) {
        ARBasicAnimation *basic =
            [ARBasicAnimation animationWithKeyPath:info.event];
        basic.fromValue = info.fromValue;
          NSString *key = ARLayerActionEventStoreKey(info.event);
        if ([info.event isEqualToString:kARLayerBackgroundColor]) {
          CGColorRef color =
              (__bridge CGColorRef)([info.layer valueForKeyPath:key]);
          basic.toValue = [UIColor colorWithCGColor:color];
        } else {
          basic.toValue = [info.layer valueForKeyPath:key];
        }
        basic.easing = [easing copy];
        basic.duration = duration;
        basic.repeatCount = repeatCount;
        basic.autoreverses = autoreverses;
        basic.fillMode = kCAFillModeBoth;
        basic.beginTime = CACurrentMediaTime() + context.delay;

        [info.layer addAnimation:basic forKey:nil];
      }];
}

+ (void)addSpringAnimationsWithContext:(ARBlockAnimationContext *)context
                              duration:(CFTimeInterval)duration
                                  mass:(CGFloat)mass
                               damping:(CGFloat)damping
                             stiffness:(CGFloat)stiffness
                       initialVelocity:(CGFloat)initialVelocity
                           repeatCount:(NSUInteger)repeatCount
                          autoreverses:(BOOL)autoreverses {

  [context.animationInfos
      enumerateObjectsUsingBlock:^(ARAnimationInfo *_Nonnull info,
                                   NSUInteger idx, BOOL *_Nonnull stop) {
        ARSpringAnimation *spring =
            [ARSpringAnimation animationWithKeyPath:info.event];
        spring.fromValue = info.fromValue;
          NSString *key = ARLayerActionEventStoreKey(info.event);
        if ([info.event isEqualToString:kARLayerBackgroundColor]) {
          CGColorRef color =
              (__bridge CGColorRef)([info.layer valueForKeyPath:key]);
          spring.toValue = [UIColor colorWithCGColor:color];
        } else {
          spring.toValue = [info.layer valueForKeyPath:key];
        }
        spring.mass = mass;
        spring.initialVelocity = initialVelocity;
        spring.damping = damping;
        spring.stiffness = stiffness;
        spring.duration = duration;
        spring.repeatCount = repeatCount;
        spring.autoreverses = autoreverses;
        spring.fillMode = kCAFillModeBoth;
        spring.beginTime = CACurrentMediaTime() + context.delay;

        [info.layer addAnimation:spring forKey:nil];
      }];
}

@end
