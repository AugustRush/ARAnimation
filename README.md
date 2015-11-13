# ARAnimation
ARAnimation is an Core Animation library to make you animations easily.

## Features (version 0.5)

* Layer animations
* Layer Spring Animations
* Custom TimingFunction(easing funtion)
* Official style block Animations

## Example

![](https://github.com/AugustRush/ARAnimation/blob/master/rotaion.gif)

* Rotation

```
 [UIView AR_animationWithDuration:1.0
                          animations:^{
                              self.redView.layer.rotation = 10;
                              self.yellowView.layer.rotation = -10;
                          }];

````

*Scale
```
[UIView AR_animationWithDuration:1.0
                          animations:^{
                              self.redView.layer.scale = 2;
                              self.yellowView.layer.scaleX = 1.5;
     } completion:^{
         //your code
     }];
```
* Custom TmingFunction
```
 [UIView AR_animationWithDuration:2.0
                               delay:1
                              easing:^CGFloat(CGFloat timePercentage) {
                                  return timePercentage * timePercentage;
                              } animations:^{
                                  self.redView.backgroundColor = [UIColor blackColor];
                              } completion:^{
                               //your code
                              }];

```

## Support Layer animatable propertys (version 0.5)
* kARLayerPosition;
* kARLayerPositionX;
* kARLayerPositionY;
* kARLayerCornerRadius;
* kARLayerZPositoin;
* kARLayerBorderWidth;
* kARLayerScaleX;
* kARLayerScaleY;
* kARLayerScale;
* kARLayerBounds;
* kARLayerBackgroundColor;
* kARLayerOpacity;
* kARLayerRotationX;
* kARLayerRotationY;
* kARLayerRotation;
* kARLayerAnchorPoint;