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

@end

NS_ASSUME_NONNULL_END
