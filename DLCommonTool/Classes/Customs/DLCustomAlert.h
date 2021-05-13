//
//  DLCustomAlert.h
//  DLCommonTool
//
//  Created by jamelee on 2021/5/13.
//

#import "DLBaseView.h"

@class DLCustomAlertConfigModel;
@interface DLCustomAlert : DLBaseView

+ (instancetype)showAlertWithTitle:(NSString *)title
                        completion:(void(^)(NSInteger buttonIndex))completion;

+ (instancetype)showAlertWithMessage:(NSString *)message
                          completion:(void(^)(NSInteger buttonIndex))completion;

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                        completion:(void(^)(NSInteger buttonIndex))completion;

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                      buttonTitles:(NSArray *)buttonTitles
                        completion:(void(^)(NSInteger buttonIndex))completion;

+ (instancetype)showAlertWithTitle:(NSString *)title
                           message:(NSString *)message
                      buttonTitles:(NSArray *)buttonTitles
                       configModel:(DLCustomAlertConfigModel *)configModel
                        completion:(void(^)(NSInteger buttonIndex))completion;

+ (instancetype)showAlertWithTitle:(NSString *)title
                          subTitle:(NSString *)subTitle
                           message:(NSString *)message
                        attMessage:(NSAttributedString *)attMessage
                      buttonTitles:(NSArray *)buttonTitles
                        completion:(void(^)(NSInteger buttonIndex))completion;

+ (instancetype)showAlertWithTitle:(NSString *)title
                          subTitle:(NSString *)subTitle
                           message:(NSString *)message
                        attMessage:(NSAttributedString *)attMessage
                      buttonTitles:(NSArray *)buttonTitles
                       configModel:(DLCustomAlertConfigModel *)configModel
                        completion:(void(^)(NSInteger buttonIndex))completion;

@end

@interface DLCustomAlertConfigModel : NSObject

/// 背景颜色
@property (nonatomic, copy  ) UIColor *contentViewBackgroundColor;
/// 标题颜色
@property (nonatomic, copy  ) UIColor *titleLabelTextColor;
/// 标题字体
@property (nonatomic, strong) UIFont  *titleLabelTextFont;
/// 副标题颜色
@property (nonatomic, copy  ) UIColor *subTitleLabelTextColor;
/// 副标题字体
@property (nonatomic, strong) UIFont  *subTitleLabelTextFont;
/// 内容颜色
@property (nonatomic, copy  ) UIColor *messageLabelTextColor;
/// 内容字体
@property (nonatomic, copy  ) UIFont  *messageLabelTextFont;
/// 按钮字体
@property (nonatomic, strong) NSArray *operateButtonTitleFonts;
/// 按钮字体颜色
@property (nonatomic, strong) NSArray *operateButtonTitleColors;
/// 按钮背景色
@property (nonatomic, strong) NSArray *operateButtonBackgroundColors;


@end
