# ![](https://github.com/AugustRush/ARAnimation/blob/develop/title.png)

*___ARAnimation is an Core Animation library to make you animations easily.___*


## Features

* __Layer animations__
* __Layer Spring Animations__
* __Custom TimingFunction(easing funtion)__
* __Official style block Animations__

## Install

#### Cocoapods 
* **pod 'ARAnimation'**

#### Manually
* **just drag demo source ducument to your project**

# Usage

## Example1

![](https://github.com/AugustRush/ARAnimation/blob/master/ex1.gif)
--------------------------------------
```
[UIView AR_animationWithDuration:2.0
                          animations:^{
                              self.redView.layer.rotation = M_PI*10;
                              self.redView.layer.cornerRadius = 50;
                          }];

```

## Example2 (Multistep animations block Nested)

![](https://github.com/AugustRush/ARAnimation/blob/master/rotaion.gif)

---------------------------------------

```
 void(^animation4)(void) = ^{
        [self.view setNeedsLayout];
        [UIView AR_animationWithDuration:0.5 delay:0.0 easing:kAREasingCurveBounceOut animations:^{
            [self.view layoutIfNeeded];
        } completion:^{
            NSLog(@"all animations completion");
        }];
    };
    
    void(^animation3)(void) = ^{
        [UIView AR_springAnimationWithDuration:1 animations:^{
            self.redView.layer.scale = 2;
            self.yellowView.layer.scale = 1;
            self.redView.layer.position = CGPointMake(CGRectGetMidX(self.view.bounds), 250);
            self.yellowView.layer.position = CGPointMake(CGRectGetMidX(self.view.bounds), 250);
        } completion:animation4];
    };
    
    void(^animation2)(void) = ^{
        [UIView AR_springAnimationWithDuration:1.5 animations:^{
            self.redView.layer.cornerRadius = CGRectGetMidX(self.redView.bounds);
            self.yellowView.layer.cornerRadius = CGRectGetMidX(self.yellowView.bounds);
        } completion:animation3];
    };
    
    void(^animation1)(void) = ^{
        [UIView AR_animationWithDuration:0.5 animations:^{
            self.redView.layer.position = CGPointMake(CGRectGetMidX(self.view.bounds), 150);
            self.yellowView.layer.position = CGPointMake(CGRectGetMidX(self.view.bounds), 150);
            self.redView.layer.scaleX = 1.3;
            self.yellowView.layer.scaleY = 1.3;
        } completion:animation2];
    };
    
    
    [UIView AR_animationWithDuration:2 animations:^{
        self.redView.backgroundColor = [self randomColor];
        self.yellowView.backgroundColor = [self randomColor];
        self.yellowView.alpha = 1;
        
        self.redView.layer.rotation = M_PI*4;
        self.yellowView.layer.rotation = -M_PI*4;
    } completion:animation1];

```



## Official block style

####Basic
```
+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                      animations:(void (^)(void))animations;

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion;

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion;

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                           delay:(CFTimeInterval)delay
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion;

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                           delay:(CFTimeInterval)delay
                          easing:(AREasingCurve)easing
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion;

+ (void)AR_animationWithDuration:(NSTimeInterval)duration
                           delay:(CFTimeInterval)delay
                     repeatCount:(NSUInteger)repeatCount
                    autoreverses:(BOOL)autoreverses
                          easing:(AREasingCurve)easing
                      animations:(void (^)(void))animations
                      completion:(void (^)(void))completion;
```
----------------------------------------

#### Spring
```
+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                            animations:(void (^)(void))animations;

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion;

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                                 delay:(CFTimeInterval)delay
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion;

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                                 delay:(CFTimeInterval)delay
                                  mass:(CGFloat)mass
                               damping:(CGFloat)damping
                             stiffness:(CGFloat)stiffness
                       initialVelocity:(CGFloat)initialVelocity
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion;

+ (void)AR_springAnimationWithDuration:(NSTimeInterval)duration
                                 delay:(CFTimeInterval)delay
                           repeatCount:(NSUInteger)repeatCount
                          autoreverses:(BOOL)autoreverses
                                  mass:(CGFloat)mass
                               damping:(CGFloat)damping
                             stiffness:(CGFloat)stiffness
                       initialVelocity:(CGFloat)initialVelocity
                            animations:(void (^)(void))animations
                            completion:(void (^)(void))completion;
```

## Support Layer animatable propertys (version 0.5)

* **kARLayerPosition**
* **kARLayerPositionX**
* **kARLayerPositionY**
* **kARLayerCornerRadius**
* **kARLayerZPositoin**
* **kARLayerBorderWidth**
* **kARLayerScaleX**
* **kARLayerScaleY**
* **kARLayerScale**
* **kARLayerBounds**
* **kARLayerBackgroundColor**
* **kARLayerOpacity**
* **kARLayerRotationX**
* **kARLayerRotationY**
* **kARLayerRotation**
* **kARLayerAnchorPoint**
* **kARShapeLayerStrokeEnd**
* **kARShapeLayerStrokeStart**

## Reference

* www.gizma.com/easing/#quad2
* https://es.wikipedia.org/wiki/Oscilador_armónico
* http://objccn.io/issue-12-4/
* https://github.com/robb/RBBAnimation

## Next

* **Add cococapods support**
* **More animatable layer's propertys**
* **Custom animaton**
* **Chainable animations ??**

## Licence

The MIT License (MIT)

Copyright (c) 2015 August

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
