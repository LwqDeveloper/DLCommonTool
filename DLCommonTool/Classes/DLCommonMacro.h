//
//  DLCommonMacro.h
//  DLCommonModule
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#ifndef DLCommonMacro_h
#define DLCommonMacro_h

/// NSLog
#ifdef DEBUG
#define NSLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define NSLog(format, ...)
#endif

/// Screen
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

/// Height
#define kStatusBarHeight    [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNaviBarHeight      (kStatusBarHeight + 44.0)
#define kSaveAreaBottom     (kStatusBarHeight > 20 ? 34.0: 0)
#define kTabBarHeight       (49.0 + kSaveAreaBottom)

/// Color
#define kHEX(__v__)         [UIColor colorWithRed:((float)((__v__ & 0xFF0000) >> 16))/255.0 green:((float)((__v__ & 0xFF00) >> 8))/255.0 blue:((float)(__v__ & 0xFF))/255.0 alpha:1.0]
#define kRGB(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]

/// Font
#define kFont_Regular(x)    [UIFont systemFontOfSize:x weight:(UIFontWeightRegular)]
#define kFont_Medium(x)     [UIFont systemFontOfSize:x weight:(UIFontWeightRegular)]
#define kFont_Semibo(x)     [UIFont systemFontOfSize:x weight:(UIFontWeightRegular)]

/// Weak-Strong
#define kWeakSelf           __weak typeof(self) weakSelf = self;
#define kStrongSelf         __weak typeof(weakSelf) strongSelf = weakSelf;

/// String
#define kFormatObject(x)    [NSString stringWithFormat:@"%@",s]
#define kFormatData(x)      [NSString stringWithFormat:@"%@",@(s)]
#define kSafeString(x)      (([x isKindOfClass:[NSNull class]] || [x isEqual:[NSNull null]] || [x isEqual:NULL] || [[x class] isSubclassOfClass:[NSNull class]] || x == nil || x == NULL || [x isKindOfClass:[NSNull class]] || [[x stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0 || [x isEqualToString:@"<null>"] || [x isEqualToString:@"(null)"]) ? @"": x)

#endif /* DLCommonMacro_h_h */
