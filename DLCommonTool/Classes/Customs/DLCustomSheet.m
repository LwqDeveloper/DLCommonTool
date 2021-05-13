//
//  DLCustomSheet.m
//  DLCommonTool
//
//  Created by jamelee on 2021/5/13.
//

#import "DLCustomSheet.h"

@interface DLCustomSheet ()

/// bg
@property (nonatomic, strong) UIView *bg;
/// co
@property (nonatomic, strong) UIView *contentView;
/// ti
@property (nonatomic, strong) NSArray *titles;
/// co
@property (nonatomic, copy  ) void(^completion)(NSInteger index);

/// mo
@property (nonatomic, strong) DLCustomSheetConfigModel *configModel;

@end

@implementation DLCustomSheet

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)reloadViews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    self.bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.bg.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    if (self.configModel.bgBackgroundColor) {
        self.bg.backgroundColor = self.configModel.bgBackgroundColor;
    }
    [self addSubview:self.bg];
    
    CGFloat ch = 49 +6 + self.titles.count *49;
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height +ch, [UIScreen mainScreen].bounds.size.width, ch)];
    [self addSubview:self.contentView];
    
    UIButton *cancle = [self buttonTitle:@"取消" hasLine:NO tag:99];
    cancle.frame = CGRectMake(0, ch -49, [UIScreen mainScreen].bounds.size.width, 49);
    if (self.configModel.cancleTitleFont) {
        cancle.titleLabel.font = self.configModel.cancleTitleFont;
    }
    if (self.configModel.cancleTitleColor) {
        [cancle setTitleColor:self.configModel.cancleTitleColor forState:UIControlStateNormal];
    }
    if (self.configModel.cancleBackgroundColor) {
        [cancle setBackgroundColor:self.configModel.cancleBackgroundColor];
    }
    [self.contentView addSubview:cancle];
    [cancle addTarget:self action:@selector(cancleBtnTap) forControlEvents:UIControlEventTouchUpInside];
    
    for (NSInteger i = 0; i < self.titles.count; i ++) {
        UIButton *btn = [self buttonTitle:self.titles[i] hasLine:i < self.titles.count -1 tag:100 +i];
        if (self.configModel &&
            i < self.configModel.buttonTitleFonts.count) {
            btn.titleLabel.font = self.configModel.buttonTitleFonts[i];
        }
        if (self.configModel &&
            i < self.configModel.buttonTitleColors.count) {
            [btn setTitleColor:self.configModel.buttonTitleColors[i] forState:UIControlStateNormal];
        }
        if (self.configModel &&
            i < self.configModel.buttonBackgroundColors.count) {
            [btn setBackgroundColor:self.configModel.buttonBackgroundColors[i]];
        }

        btn.frame = CGRectMake(0, 49 *i, [UIScreen mainScreen].bounds.size.width, 49);
        [btn addTarget:self action:@selector(titlesBtnTap:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
}

- (UIButton *)buttonTitle:(NSString *)title hasLine:(BOOL)hasLine tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = tag;
    button.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49);
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:42.0 /255.0 green:47.0 /255.0 blue:55.0 /255.0 alpha:1]];

    if (hasLine) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 48.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
        line.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        [button addSubview:line];
    }
    return button;
}

- (void)titlesBtnTap:(UIButton *)btn {
    if (self.completion) {
        self.completion(btn.tag -100);
    }
    [self hide];
}

- (void)cancleBtnTap {
    [self hide];
}

- (void)showToView:(UIView *)view {
    [self reloadViews];
    [view addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.contentView.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height -self.contentView.bounds.size.height;
        self.contentView.frame = frame;
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.contentView.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.contentView.frame = frame;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

+ (void)showSheetTitles:(NSArray *)titles completion:(void(^)(NSInteger index))completion {
    [self showSheetTitles:titles configModel:nil completion:completion];
}

+ (void)showSheetTitles:(NSArray *)titles configModel:(DLCustomSheetConfigModel *)configModel completion:(void(^)(NSInteger index))completion {
    DLCustomSheet *sheet = [[DLCustomSheet alloc] initWithFrame:[UIScreen mainScreen].bounds];
    sheet.titles = titles;
    sheet.completion = completion;
    sheet.configModel = configModel;
    [sheet showToView:[UIApplication sharedApplication].keyWindow];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation DLCustomSheetConfigModel

@end
