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

/// ????????????
@property (nonatomic, copy  ) UIColor *contentViewBackgroundColor;
/// ????????????
@property (nonatomic, copy  ) UIColor *titleLabelTextColor;
/// ????????????
@property (nonatomic, strong) UIFont  *titleLabelTextFont;
/// ???????????????
@property (nonatomic, copy  ) UIColor *subTitleLabelTextColor;
/// ???????????????
@property (nonatomic, strong) UIFont  *subTitleLabelTextFont;
/// ????????????
@property (nonatomic, copy  ) UIColor *messageLabelTextColor;
/// ????????????
@property (nonatomic, copy  ) UIFont  *messageLabelTextFont;
/// ????????????
@property (nonatomic, strong) NSArray *operateButtonTitleFonts;
/// ??????????????????
@property (nonatomic, strong) NSArray *operateButtonTitleColors;
/// ???????????????
@property (nonatomic, strong) NSArray *operateButtonBackgroundColors;


@end
