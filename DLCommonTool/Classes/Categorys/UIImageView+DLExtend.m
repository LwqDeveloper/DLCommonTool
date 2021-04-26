//
//  UIImageView+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UIImageView+DLExtend.h"

@implementation UIImageView (DLExtend)

+ (UIImageView * _Nonnull (^)(void))create {
    return ^ {
        UIImageView *imv = [[UIImageView alloc] initWithFrame:CGRectZero];
        return imv;
    };
}

@end
