//
//  DLCustomAlert.m
//  DLCommonTool
//
//  Created by jamelee on 2021/5/13.
//

#import "DLCustomAlert.h"

static const CGFloat DLAlertviewTitleFont       = 21;
static const CGFloat DLAlertviewSubTitleFont    = 17;
static const CGFloat DLAlertviewMessageFont     = 17;
static const CGFloat DLAlertviewButtonFont      = 17;

static const CGFloat DLAlertViewLeading         = 25;
static const CGFloat DLAlertViewButtonHeight    = 44;
static const CGFloat DLAlertViewLineWidth       = 0.5;
static const CGFloat DLAlertViewContentSpace    = 12;
static const CGFloat DLAlertViewContentLeading  = 12;

@interface DLCustomAlert ()

@property (nonatomic, weak  ) UIView *alertView;

@property (nonatomic, copy  ) void(^completion)(NSInteger buttonIndex);

@property (nonatomic, strong) DLCustomAlertConfigModel *configModel;

@end


@implementation DLCustomAlert

- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle
                      message:(NSString *)message
                   attMessage:(NSAttributedString *)attMessage
                 buttonTitles:(NSArray *)buttonTitles
                  configModel:(DLCustomAlertConfigModel *)configModel
                   completion:(void(^)(NSInteger buttonIndex))completion
{
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)]) {
        self.completion = completion;
        
        //background view
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        [self addSubview:bgView];
        
        //contentView
        UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(DLAlertViewLeading, 0, self.bounds.size.width -DLAlertViewLeading *2, 20)];
        alertView.backgroundColor = [UIColor whiteColor];
        if (self.configModel.contentViewBackgroundColor) {
            alertView.backgroundColor = self.configModel.contentViewBackgroundColor;
        }
        alertView.layer.cornerRadius = 5.0;
        alertView.clipsToBounds = YES;
        [self addSubview:self.alertView = alertView];
        
        CGFloat topY_ = DLAlertViewContentSpace;
        
        //title
        if (title.length > 0) {
            UILabel *titleLabel = [self addLabelTitle:title color:[UIColor blackColor] font:[UIFont systemFontOfSize:DLAlertviewTitleFont]];
            if (self.configModel.titleLabelTextFont) {
                titleLabel.font = self.configModel.titleLabelTextFont;
            }
            if (self.configModel.titleLabelTextColor) {
                titleLabel.textColor = self.configModel.titleLabelTextColor;
            }
            [self dl_resetView:titleLabel frameKey:@"y" value:topY_];
            topY_ += titleLabel.bounds.size.height;
            topY_ += DLAlertViewContentSpace;
        }
        
        //subTitle
        if (subTitle.length > 0) {
            UILabel *subTitleLabel = [self addLabelTitle:subTitle color:[UIColor blackColor] font:[UIFont systemFontOfSize:DLAlertviewSubTitleFont]];
            if (self.configModel.subTitleLabelTextFont) {
                subTitleLabel.font = self.configModel.subTitleLabelTextFont;
            }
            if (self.configModel.subTitleLabelTextColor) {
                subTitleLabel.textColor = self.configModel.subTitleLabelTextColor;
            }
            [self dl_resetView:subTitleLabel frameKey:@"y" value:topY_];
            topY_ += subTitleLabel.bounds.size.height;
            topY_ += DLAlertViewContentSpace;
        }

        //message
        if ([attMessage isKindOfClass:[NSString class]]) {
            attMessage = [[NSAttributedString alloc] initWithString:(NSString *)attMessage];
        }
        
        if (message.length > 0 || attMessage.string.length > 0) {
            UITextView *messageView = [[UITextView alloc] initWithFrame:CGRectMake(DLAlertViewContentLeading, topY_, self.alertView.bounds.size.width -DLAlertViewContentLeading *2, 20)];
            if (message.length > 0) {
                messageView.text = message;
            } else if (attMessage.string.length > 0) {
                messageView.attributedText = attMessage;
            }
            messageView.font = [UIFont systemFontOfSize:DLAlertviewMessageFont];
            if (self.configModel.messageLabelTextFont) {
                messageView.font = self.configModel.messageLabelTextFont;
            }
            messageView.textColor = [UIColor darkGrayColor];
            if (self.configModel.messageLabelTextColor) {
                messageView.textColor = self.configModel.messageLabelTextColor;
            }
            messageView.editable = NO;
            messageView.showsVerticalScrollIndicator = NO;
            messageView.backgroundColor = [UIColor clearColor];
            messageView.textAlignment = NSTextAlignmentCenter;
            [self.alertView addSubview:messageView];

            CGFloat maxMessageViewHeight = self.bounds.size.height -130*2 -DLAlertViewButtonHeight -topY_;
            CGFloat messageContentHeight = [self heightForTextView:messageView width:messageView.bounds.size.width];
            if (messageContentHeight <= maxMessageViewHeight) {
                [self dl_resetView:messageView frameKey:@"height" value:messageContentHeight];
            } else {
                [self dl_resetView:messageView frameKey:@"height" value:maxMessageViewHeight];
            }
            topY_ += messageView.bounds.size.height;
            topY_ += DLAlertViewContentSpace;
        }
        
        //buttons
        if (buttonTitles.count > 0) {
            for (NSInteger i = 0; i < buttonTitles.count; i ++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.tag = 100 +i;
                button.frame = CGRectMake(alertView.bounds.size.width /buttonTitles.count *i, topY_, alertView.bounds.size.width /buttonTitles.count, DLAlertViewButtonHeight);
                button.titleLabel.font = [UIFont systemFontOfSize:DLAlertviewButtonFont];
                if (self.configModel.operateButtonTitleFonts &&
                    i < self.configModel.operateButtonTitleFonts.count) {
                    button.titleLabel.font = self.configModel.operateButtonTitleFonts[i];
                }
                [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
                button.titleLabel.adjustsFontSizeToFitWidth = YES;
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                if (self.configModel.operateButtonTitleColors &&
                    i < self.configModel.operateButtonTitleColors.count) {
                    [button setTitleColor:self.configModel.operateButtonTitleColors[i] forState:UIControlStateNormal];
                }
                button.backgroundColor = [UIColor clearColor];
                if (self.configModel.operateButtonBackgroundColors &&
                    i < self.configModel.operateButtonBackgroundColors.count) {
                    button.backgroundColor = self.configModel.operateButtonBackgroundColors[i];
                }
                [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
                [button addTarget:self action:@selector(setBackgroundColorForButton:) forControlEvents:UIControlEventTouchDown];
                [button addTarget:self action:@selector(setBackgroundColorForButton:) forControlEvents:UIControlEventTouchDragEnter];
                [button addTarget:self action:@selector(clearBackgroundColorForButton:) forControlEvents:UIControlEventTouchDragExit];
                [alertView addSubview:button];
                
                //v line
                if (i > 0) {
                    UIView *vLine = [self lineFrame:CGRectMake(0, 0, DLAlertViewLineWidth, button.bounds.size.height)];
                    [button addSubview:vLine];
                }
            }
            //h line
            UIView *hLine = [self lineFrame:CGRectMake(0, topY_, alertView.bounds.size.width, DLAlertViewLineWidth)];
            [alertView addSubview:hLine];
            
            topY_ += DLAlertViewButtonHeight;
        }
        [self dl_resetView:self.alertView frameKey:@"height" value:topY_];
    }
    return self;
}

#pragma mark - event response
- (void)buttonTap:(UIButton *)button
{
    if (self.completion) {
        self.completion(button.tag -100);
    }
    [self dl_hide];
}

- (void)setBackgroundColorForButton:(UIButton *)sender
{
    [sender setBackgroundColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5]];
}

- (void)clearBackgroundColorForButton:(UIButton *)sender
{
    [sender setBackgroundColor:[UIColor clearColor]];
}

#pragma mark - custom method
- (CGFloat)calculatHeightOfLabel:(UILabel *)label
{
    return [self heightOfText:label.text width:label.bounds.size.width font:label.font];
}

- (CGFloat)heightOfText:(NSString *)text width:(CGFloat)width font:(UIFont *)font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font}
                                     context:nil];
    return rect.size.height;
}

- (void)dl_showInView:(UIView *)view
{
    [self dl_resetView:self.alertView frameKey:@"y" value:view.bounds.size.height /2. -self.alertView.bounds.size.height /2.];
    [super dl_showInView:view];
}

#pragma mark - custom view
- (UILabel *)addLabelTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(DLAlertViewContentLeading, 0, self.alertView.bounds.size.width -DLAlertViewContentLeading *2, 20)];
    label.font = font;
    label.textColor = color;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    if (title.length > 0) {
        label.text = title;
        [self dl_resetView:label frameKey:@"height" value:[self calculatHeightOfLabel:label]];
        [self.alertView addSubview:label];
    } else {
        [self dl_resetView:label frameKey:@"height" value:0];
    }
    return label;
}

- (UIView *)lineFrame:(CGRect)frame
{
    UIView *line = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = [UIColor lightGrayColor];
    return line;
}

- (CGFloat)heightForTextView:(UITextView *)textView width:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}


- (CGFloat)heightOfText:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    label.text = text;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label.frame.size.height;
}

#pragma mark -
+ (instancetype)showAlertWithTitle:(NSString *)title
                        completion:(void(^)(NSInteger buttonIndex))completion
{
    return [self showAlertWithTitle:title message:@"" buttonTitles:@[@"取消",@"确定"] completion:completion];
}

+ (instancetype)showAlertWithMessage:(NSString *)message
                          completion:(void(^)(NSInteger buttonIndex))completion
{
    return [self showAlertWithTitle:@"" message:message buttonTitles:@[@"取消",@"确定"] completion:completion];
}

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                        completion:(void(^)(NSInteger buttonIndex))completion
{
    return [self showAlertWithTitle:title message:message buttonTitles:@[@"取消",@"确定"] completion:completion];
}

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                      buttonTitles:(NSArray *)buttonTitles
                        completion:(void(^)(NSInteger buttonIndex))completion
{
    return [self showAlertWithTitle:title subTitle:nil message:message attMessage:nil buttonTitles:buttonTitles completion:completion];
}

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                      buttonTitles:(NSArray *)buttonTitles
                       configModel:(DLCustomAlertConfigModel *)configModel
                        completion:(void(^)(NSInteger buttonIndex))completion
{
    return [self showAlertWithTitle:title subTitle:nil message:message attMessage:nil buttonTitles:buttonTitles configModel:configModel completion:completion];
}

+ (instancetype)showAlertWithTitle:(NSString *)title
                          subTitle:(NSString *)subTitle
                           message:(NSString *)message
                        attMessage:(NSAttributedString *)attMessage
                      buttonTitles:(NSArray *)buttonTitles
                        completion:(void(^)(NSInteger buttonIndex))completion
{
    return [self showAlertWithTitle:title subTitle:subTitle message:message attMessage:attMessage buttonTitles:buttonTitles configModel:nil completion:completion];
}

+ (instancetype)showAlertWithTitle:(NSString *)title
                          subTitle:(NSString *)subTitle
                           message:(NSString *)message
                        attMessage:(NSAttributedString *)attMessage
                      buttonTitles:(NSArray *)buttonTitles
                       configModel:(DLCustomAlertConfigModel *)configModel
                        completion:(void(^)(NSInteger buttonIndex))completion
{
    DLCustomAlert *alertView = [[self alloc] initWithTitle:title
                                                subTitle:subTitle
                                                 message:message
                                              attMessage:attMessage
                                            buttonTitles:buttonTitles
                                             configModel:configModel
                                              completion:completion];
    [alertView dl_showInView:[[UIApplication sharedApplication] keyWindow]];
    return alertView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation DLCustomAlertConfigModel

@end
