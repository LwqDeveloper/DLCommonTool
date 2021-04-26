//
//  UIDevice+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (DLExtend)

/// Model Identifier
- (NSString *)platform;
/// Model Identifier转为Generation
- (NSString *)platformString;
/// Mac地址
- (NSString *)macAddress;
/// IPd地址
- (NSString *)ipAddresses;

@end

NS_ASSUME_NONNULL_END
