//
//  UITextField+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "UITextField+DLExtend.h"

@implementation UITextField (DLExtend)

- (void)setPlaceholder:(NSString *)placeholder color:(UIColor *)color {
    self.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: color}];
}

- (void)addFieldLeftViewImageName:(NSString *)imageName viewSize:(CGSize)viewSize imageFrame:(CGRect)imageFrame {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    UIImageView *imv = [[UIImageView alloc] initWithFrame:imageFrame];
    imv.image = [UIImage imageNamed:imageName];
    [view addSubview:imv];
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addFieldLeftViewText:(NSString *)text font:(UIFont *)font color:(UIColor *)color viewSize:(CGSize)viewSize leading:(CGFloat)leading {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewSize.width, viewSize.height)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(leading, 0, viewSize.width -leading, viewSize.height)];
    label.text = text;
    label.font = font;
    label.textColor = color;
    [view addSubview:label];
        
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
