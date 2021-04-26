//
//  UILabel+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UILabel+DLExtend.h"

@implementation UILabel (DLExtend)

/// create
+ (UILabel *(^)(void))create {
    return ^{
        UILabel *lb = [[UILabel alloc] init];
        return lb;
    };
}

/// font
- (UILabel *(^)(UIFont *))dl_font {
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

/// text
- (UILabel *(^)(NSString *))dl_text {
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

/// textColor
- (UILabel *(^)(UIColor *))dl_textColor {
    return ^(id textColor){
        self.textColor = textColor;
        return self;
    };
}

/// backgroundColor
- (UILabel *(^)(UIColor *))dl_backgroundColor {
    return ^(id backgroundColor){
        self.backgroundColor = backgroundColor;
        return self;
    };
}

/// textAlignment
- (UILabel *(^)(NSTextAlignment))dl_textAlignment {
    return ^(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}

/// numberOfLines
- (UILabel *(^)(NSInteger))dl_numberOfLines {
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}



@end
