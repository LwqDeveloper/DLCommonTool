//
//  UITextField+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (DLExtend)

- (void)setPlaceholder:(NSString *)placeholder color:(UIColor *)color;

- (void)addFieldLeftViewImageName:(NSString *)imageName viewSize:(CGSize)viewSize imageFrame:(CGRect)imageFrame;

- (void)addFieldLeftViewText:(NSString *)text font:(UIFont *)font color:(UIColor *)color viewSize:(CGSize)viewSize leading:(CGFloat)leading;

@end

NS_ASSUME_NONNULL_END
