//
//  UIView+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UIView+DLExtend.h"

@implementation UIView (DLExtend)

- (CGFloat)dl_left {
    return self.frame.origin.x;
}

- (void)setDl_left:(CGFloat)dl_left {
    CGRect frame = self.frame;
    frame.origin.x = dl_left;
    self.frame = frame;
}

- (CGFloat)dl_top {
    return self.frame.origin.y;
}

- (void)setDl_top:(CGFloat)dl_top {
    CGRect frame = self.frame;
    frame.origin.y = dl_top;
    self.frame = frame;
}

- (CGFloat)dl_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setDl_right:(CGFloat)dl_right {
    CGRect frame = self.frame;
    frame.origin.x = dl_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)dl_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDl_bottom:(CGFloat)dl_bottom {
    CGRect frame = self.frame;
    frame.origin.y = dl_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)dl_width {
    return self.frame.size.width;
}

- (void)setDl_width:(CGFloat)dl_width {
    CGRect frame = self.frame;
    frame.size.width = dl_width;
    self.frame = frame;
}

- (CGFloat)dl_height {
    return self.frame.size.height;
}

- (void)setDl_height:(CGFloat)dl_height {
    CGRect frame = self.frame;
    frame.size.height = dl_height;
    self.frame = frame;
}

- (CGFloat)dl_centerX {
    return self.center.x;
}

- (void)setDl_centerX:(CGFloat)dl_centerX {
    self.center = CGPointMake(dl_centerX, self.center.y);
}

- (CGFloat)dl_centerY {
    return self.center.y;
}

- (void)setDl_centerY:(CGFloat)dl_centerY {
    self.center = CGPointMake(self.center.x, dl_centerY);
}

- (CGPoint)dl_origin {
    return self.frame.origin;
}

- (void)setDl_origin:(CGPoint)dl_origin {
    CGRect frame = self.frame;
    frame.origin = dl_origin;
    self.frame = frame;
}

- (CGSize)dl_size {
    return self.frame.size;
}

- (void)setDl_size:(CGSize)dl_size {
    CGRect frame = self.frame;
    frame.size = dl_size;
    self.frame = frame;
}


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
