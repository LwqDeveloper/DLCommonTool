//
//  UIView+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DLExtend)

///frame.origin.x.
@property (nonatomic) CGFloat dl_left;
///frame.origin.y
@property (nonatomic) CGFloat dl_top;
///frame.origin.x + frame.size.width
@property (nonatomic) CGFloat dl_right;
///frame.origin.y + frame.size.height
@property (nonatomic) CGFloat dl_bottom;
///frame.size.width.
@property (nonatomic) CGFloat dl_width;
///frame.size.height.
@property (nonatomic) CGFloat dl_height;
///center.x
@property (nonatomic) CGFloat dl_centerX;
///center.y
@property (nonatomic) CGFloat dl_centerY;
///frame.origin.
@property (nonatomic) CGPoint dl_origin;
///frame.size.
@property (nonatomic) CGSize  dl_size;

/// tag
- (UIView *(^)(CGFloat tag))dl_tag;
/// frame
- (UIView *(^)(CGRect))dl_frame;
/// corner
- (UIView *(^)(CGFloat cornerRadius))dl_cornerRadius;
/// border
- (UIView *(^)(UIColor *color, CGFloat width))dl_border;
/// toSuperview
- (UIView *(^)(UIView *))dl_toSuperview;

/// 获取截图
- (UIImage *)getSnapImage;
/// 添加渐渐层
- (CAGradientLayer *)addGradientLayerFrame:(CGRect)frame StartC:(UIColor *)startC startP:(CGPoint)startP endC:(UIColor *)endC endP:(CGPoint)endP;
/// 获取视图控制器
- (UIViewController *)getViewController;

@end

NS_ASSUME_NONNULL_END
