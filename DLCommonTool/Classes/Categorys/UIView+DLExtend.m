//
//  UIView+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UIView+DLExtend.h"

@implementation UIView (DLExtend)

- (UIView * _Nonnull (^)(CGFloat))dl_tag {
    return ^(CGFloat tag) {
        self.tag = tag;
        return self;
    };
}

/// frame
- (UIView *(^)(CGRect))dl_frame {
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))dl_cornerRadius {
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull, CGFloat))dl_border {
    return ^(UIColor *color, CGFloat width) {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = width;
        return self;
    };
}

/// toSuperview
- (UIView * _Nonnull (^)(UIView * _Nonnull))dl_toSuperview {
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

/// 获取截图
- (UIImage *)getSnapImage {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/// 添加渐渐层
- (CAGradientLayer *)addGradientLayerFrame:(CGRect)frame StartC:(UIColor *)startC startP:(CGPoint)startP endC:(UIColor *)endC endP:(CGPoint)endP {
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = frame;
    gl.startPoint = startP;
    gl.endPoint = endP;
    gl.colors = @[(__bridge id)startC.CGColor,(__bridge id)endC.CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [self.layer addSublayer:gl];
    return gl;
}

/// 获取视图控制器
- (UIViewController *)getViewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;

}

@end
