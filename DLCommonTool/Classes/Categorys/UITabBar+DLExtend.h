//
//  UITabBar+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (DLExtend)

/// 显示红点
- (void)showBadgeOnItemIndex:(int)index tabCount:(NSInteger)tabCount;

/// 隐藏红点
- (void)hideBadgeOnItemIndex:(int)index;

/// 移除控件
- (void)removeBadgeOnItemIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
