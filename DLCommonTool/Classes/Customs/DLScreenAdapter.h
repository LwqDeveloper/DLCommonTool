//
//  DLScreenAdapter.h
//  DLCommonTool
//
//  Created by jamelee on 2021/5/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** 适配手机类型 */
typedef NS_ENUM(NSInteger,DLScreenAdapterPhoneType) {
    /** iPhone3GS_4_4S */
    DLScreenAdapterPhoneType_iPhone3GS_4_4S    = 0,
    /** iPhone5_5C_5S_5SE */
    DLScreenAdapterPhoneType_iPhone5_5C_5S_5SE = 1,
    /** iPhone6_6S_7_8 */
    DLScreenAdapterPhoneType_iPhone6_6S_7_8_SE = 2,
    /** iPhone6Plus_6SPlus_7Plus_8Plus */
    DLScreenAdapterPhoneType_iPhone6Plus_6SPlus_7Plus_8Plus = 3,
    /** iPhoneX_XS_11Pro_12mini */
    DLScreenAdapterPhoneType_iPhoneX_XS_11Pro_12mini        = 4,
    /** iPhoneXSMax_XR_11_11ProMax */
    DLScreenAdapterPhoneType_iPhoneXSMax_XR_11_11ProMax     = 5,
    /** iPhone12_12Pro */
    DLScreenAdapterPhoneType_iPhone12_12Pro                 = 6,
    /** iPhone12ProMax */
    DLScreenAdapterPhoneType_iPhone12ProMax                 = 7,
    /** 其他 */
    DLScreenAdapterPhoneTypeOther                           = 8,
};

/** 所需适配机型-屏幕宽 */
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhone3GS_4_4S;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhone5_5C_5S_5SE;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhone6_6S_7_8_SE;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhone6Plus_6SPlus_7Plus_8Plus;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhoneX_XS_11Pro_12mini;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhoneXSMax_XR_11_11ProMax;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhone12_12Pro;
UIKIT_EXTERN CGFloat const SCREEN_WIDTH_iPhone12ProMax;

/** 所需适配机型-屏幕高 */
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhone3GS_4_4S;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhone5_5C_5S_5SE;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhone6_6S_7_8_SE;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhone6Plus_6SPlus_7Plus_8Plus;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhoneX_XS_11Pro_12mini;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhoneXSMax_XR_11_11ProMax;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhone12_12Pro;
UIKIT_EXTERN CGFloat const SCREEN_HEIGHT_iPhone12ProMax;

/** 屏幕宽度 */
static inline CGFloat DLScreenWidth() {
    return [UIScreen mainScreen].bounds.size.width;
}

/** 幕高度 */
static inline CGFloat tScreenHeight() {
    return [UIScreen mainScreen].bounds.size.height;
}

/** 当前屏幕类型 */
static inline DLScreenAdapterPhoneType DLScreenCurrentType() {
    if (tScreenHeight() == SCREEN_HEIGHT_iPhone3GS_4_4S) return DLScreenAdapterPhoneType_iPhone3GS_4_4S;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhone5_5C_5S_5SE) return DLScreenAdapterPhoneType_iPhone5_5C_5S_5SE;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhone6_6S_7_8_SE) return DLScreenAdapterPhoneType_iPhone6_6S_7_8_SE;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhone6Plus_6SPlus_7Plus_8Plus) return DLScreenAdapterPhoneType_iPhone6Plus_6SPlus_7Plus_8Plus;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhoneX_XS_11Pro_12mini) return DLScreenAdapterPhoneType_iPhoneX_XS_11Pro_12mini;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhoneXSMax_XR_11_11ProMax) return DLScreenAdapterPhoneType_iPhoneXSMax_XR_11_11ProMax;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhone12_12Pro) return DLScreenAdapterPhoneType_iPhone12_12Pro;
    if (tScreenHeight() == SCREEN_HEIGHT_iPhone12ProMax) return DLScreenAdapterPhoneType_iPhone12ProMax;
    return DLScreenAdapterPhoneTypeOther;
}

@interface DLScreenAdapter : NSObject

/** 屏幕默认类型 默认为DLScreenAdapterPhoneType_iPhone6_6S_7_8 */
@property (nonatomic, assign) DLScreenAdapterPhoneType defaultType;

/** 屏幕宽度 */
@property (nonatomic,readonly) CGFloat defaultScreenWidth;

/** 屏幕高度 */
@property (nonatomic,readonly) CGFloat defaultScreenHeight;

/** 共享适配器 */
+ (instancetype)shareAdapter;

@end

/** 真实字体大小 */
static inline CGFloat dlRealFontSize(CGFloat defaultSize) {
    if ([DLScreenAdapter shareAdapter].defaultType == DLScreenCurrentType())
        return defaultSize;
    return DLScreenWidth() / [DLScreenAdapter shareAdapter].defaultScreenWidth * defaultSize;
}

/** 真实长度 */
static inline CGFloat dlRealLength(CGFloat defaultLength) {
    if ([DLScreenAdapter shareAdapter].defaultType == DLScreenCurrentType())
        return defaultLength;
    return DLScreenWidth() / [DLScreenAdapter shareAdapter].defaultScreenWidth * defaultLength;
}

