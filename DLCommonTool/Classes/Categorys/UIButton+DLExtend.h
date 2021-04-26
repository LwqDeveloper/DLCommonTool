//
//  UIButton+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (DLExtend)

/// create
+ (UIButton *(^)(void))create;
/// title
- (UIButton *(^)(NSString *title))title;
/// titleFont
- (UIButton *(^)(UIFont *font))titleFont;
/// titleColor
- (UIButton *(^)(UIColor *color))titleColor;
/// bgNormalImage
- (UIButton *(^)(UIImage *bgNormalImage))bgNormalImage;
/// bgSelectedImage
- (UIButton *(^)(UIImage *bgSelectedImage))bgSelectedImage;
/// normalImage
- (UIButton *(^)(UIImage *image))normalImage;
/// selectedImage
- (UIButton *(^)(UIImage *selectedImage))selectedImage;
/// bgColor
- (UIButton *(^)(UIColor *color))bgColor;


@end

NS_ASSUME_NONNULL_END
