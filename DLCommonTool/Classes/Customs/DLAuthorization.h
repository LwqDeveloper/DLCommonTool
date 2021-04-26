//
//  DLAuthorization.h
//  DLCommonModule
//
//  Created by jamelee on 2020/11/5.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import AssetsLibrary;
@import Photos;
@import AddressBook;
@import Contacts;
@import AVFoundation;
@import CoreBluetooth;
@import EventKit;
@import Speech;

typedef NS_ENUM(NSUInteger, DLPrivacyType){
    DLPrivacyTypeNone               = 0,
    DLPrivacyTypePhotos             = 1, // 照片
    DLPrivacyTypeCamera             = 2, // 相机
    DLPrivacyTypeMicrophone         = 3, // 麦克风
    DLPrivacyTypeAddressBook        = 4, // 通讯录
    DLPrivacyTypeCalendars          = 5, // 日历
    DLPrivacyTypeReminders          = 6, // 提醒事项
    DLPrivacyTypeSpeechRecognition  = 7, // 语音识别 >= iOS10
};

typedef NS_ENUM(NSUInteger, DLAuthorizationStatus) {
    DLAuthorizationStatusAuthorized = 0,    // 已授权
    DLAuthorizationStatusDenied,            // 拒绝
    DLAuthorizationStatusRestricted,        // 应用没有相关权限，且当前用户无法改变这个权限，比如:家长控制
    DLAuthorizationStatusNotSupport         // 硬件等不支持
};


NS_ASSUME_NONNULL_BEGIN

@interface DLAuthorization : NSObject

/**
 请求对应的权限
 
 @param type 权限类型
 @param callback 返回权限状态，和是否是is第一次授权
 */
+ (void)requestPrivacyType:(DLPrivacyType)type authorizationStatus:(void(^)(DLAuthorizationStatus status, BOOL isFirstAuthorization))callback;

@end

NS_ASSUME_NONNULL_END
