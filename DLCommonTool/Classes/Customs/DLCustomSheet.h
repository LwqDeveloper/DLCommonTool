//
//  DLCustomSheet.h
//  DLCommonTool
//
//  Created by jamelee on 2021/5/13.
//

#import <UIKit/UIKit.h>

@class DLCustomSheetConfigModel;
@interface DLCustomSheet : UIView

+ (void)showSheetTitles:(NSArray *)titles
             completion:(void(^)(NSInteger index))completion;

+ (void)showSheetTitles:(NSArray *)titles
            configModel:(DLCustomSheetConfigModel *)configModel
             completion:(void(^)(NSInteger index))completion;

@end

@interface DLCustomSheetConfigModel : NSObject

/// 遮罩颜色
@property (nonatomic, strong) UIColor *bgBackgroundColor;
/// 按钮字体
@property (nonatomic, strong) NSArray *buttonTitleFonts;
/// 按钮颜色
@property (nonatomic, strong) NSArray *buttonTitleColors;
/// 按钮颜色
@property (nonatomic, strong) NSArray *buttonBackgroundColors;

/// 取消字体
@property (nonatomic, strong) UIFont *cancleTitleFont;
/// 取消颜色
@property (nonatomic, strong) UIColor *cancleTitleColor;
/// 取消颜色
@property (nonatomic, strong) UIColor *cancleBackgroundColor;

@end
