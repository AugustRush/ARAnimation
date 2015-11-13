# ARAnimation
ARAnimation is an Core Animation library to make you animations easily.

## Features (version 0.5)

* Layer animations
* Layer Spring Animations
* Custom TimingFunction(easing funtion)
* Official style block Animations

## Example

* Rotation

```
[UIView AR_animationWithDuration:2 animations:^{
        self.redView.layer.rotation = M_PI*2;
        self.yellowView.layer.rotation = -M_PI*2;
    } completion:animation1];
````

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