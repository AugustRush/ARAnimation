//
//  ViewController.m
//  ARAnimationDemo
//
//  Created by AugustRush on 15/11/13.
//  Copyright © 2015年 AugustRush. All rights reserved.
//

#import "ViewController.h"
#import "ARAnimation.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *redView;
@property (nonatomic, weak) IBOutlet UIView *yellowView;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ViewController

#pragma mark - -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.view.bounds;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    self.shapeLayer.lineWidth = 2;
    [self.view.layer addSublayer:self.shapeLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ==

- (IBAction)buttonClicked:(id)sender {
    [self multipleViewAnimations];
    
//    [self rotationAnimation];
}

#pragma mark - --

- (void)rotationAnimation {
    
    ARBasicAnimation *rotationAnimation = [ARBasicAnimation animationWithKeyPath:kARLayerRotation];
    rotationAnimation.fromValue = @0;
    rotationAnimation.toValue = @10;
    [self.redView.layer addAnimation:rotationAnimation forKey:nil];
    [self.yellowView.layer addAnimation:rotationAnimation forKey:nil];
    
    [UIView AR_animationWithDuration:1.0
                          animations:^{
                              self.redView.layer.rotation = 10;
                              self.yellowView.layer.rotation = -10;
                          }];
   
   
    [UIView AR_animationWithDuration:2.0
                               delay:1
                              easing:^CGFloat(CGFloat timePercentage) {
                                  return timePercentage * timePercentage;
                              } animations:^{
                                  self.redView.backgroundColor = [UIColor blackColor];
                              } completion:^{
                               //your code
                              }];
}

- (void)multipleViewAnimations {
    void(^animation5)(void) = ^{
        self.shapeLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)].CGPath;
        ARBasicAnimation *strokeEnd = [ARBasicAnimation animationWithKeyPath:kARShapeLayerStrokeEnd];
        strokeEnd.fromValue = @0;
        strokeEnd.toValue = @1;
        strokeEnd.duration =2;
        strokeEnd.easing = kAREasingCurveBounceInOut;
        [self.shapeLayer addAnimation:strokeEnd forKey:nil];
        self.shapeLayer.strokeEnd = 1;
    };

    void(^animation4)(void) = ^{
        [self.view setNeedsLayout];
        [UIView AR_animationWithDuration:0.5 delay:0.0 easing:kAREasingCurveBounceOut animations:^{
            [self.view layoutIfNeeded];
        } completion:animation5];
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
}

- (UIColor *) randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
