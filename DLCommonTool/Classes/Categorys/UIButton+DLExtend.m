//
//  UIButton+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UIButton+DLExtend.h"

@implementation UIButton (DLExtend)

/// create
+ (UIButton * _Nonnull (^)(void))create {
    return ^{
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        return btn;
    };
}

/// title
- (UIButton * _Nonnull (^)(NSString * _Nonnull))title {
    return ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

/// titleFont
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))titleFont {
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

/// titleColor
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))titleColor {
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

/// normalImage
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))normalImage {
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}

/// selectedImage
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))selectedImage {
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}

/// bgNormalImage
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))bgNormalImage {
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

/// bgSelectedImage
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))bgSelectedImage {
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateSelected];
        return self;
    };
}


/// bgColor
- (UIButton *(^)(UIColor *color))bgColor {
    return ^(UIColor *color){
        [self setBackgroundColor:color];
        return self;
    };
}


@end
