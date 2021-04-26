//
//  UILabel+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DLExtend)

/// 创建
+ (UILabel *(^)(void))create;
/// font
- (UILabel *(^)(UIFont *))dl_font;
/// text
- (UILabel *(^)(NSString *))dl_text;
/// textColor
- (UILabel *(^)(UIColor *))dl_textColor;
/// backgroundColor
- (UILabel *(^)(UIColor *))dl_backgroundColor;
/// textAlignment
- (UILabel *(^)(NSTextAlignment))dl_textAlignment;
/// numberOfLines
- (UILabel *(^)(NSInteger))dl_numberOfLines;

@end

NS_ASSUME_NONNULL_END
