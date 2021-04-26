//
//  DLAuthorization.m
//  DLCommonModule
//
//  Created by jamelee on 2020/11/5.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "DLAuthorization.h"

@implementation DLAuthorization

+ (void)requestPrivacyType:(DLPrivacyType)type authorizationStatus:(void(^)(DLAuthorizationStatus status, BOOL isFirstAuthorization))callback {
    switch (type) {
        case DLPrivacyTypePhotos: { //照片
            [self requestImagePickerAuthorization:callback];
            break;
        }
        case DLPrivacyTypeCamera: { //相机
            [self requestCameraAuthorization:callback];
            break;
        }
        case DLPrivacyTypeMicrophone: { //麦克风
            [self requestMicrophoneAuthorization:callback];
            break;
        }
        case DLPrivacyTypeAddressBook: { //通讯录
            [self requestAddressBookAuthorization:callback];
            break;
        }
        case DLPrivacyTypeCalendars: { // 日历
            [self requestCalendarsAuthorization:callback];
            break;
        }
        case DLPrivacyTypeReminders: { //提醒事项
            [self requestRemindersAuthorization:callback];
            break;
        }
        case DLPrivacyTypeSpeechRecognition: { //语音识别
            [self requestSpeechRecognitionAuthorization:callback];
            break;
        }
        default:
            break;
    }
}

//MARK: -相册
+ (void)requestImagePickerAuthorization:(void(^)(DLAuthorizationStatus status, BOOL isFirstAuthorization))callback {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusNotDetermined) { // 用户尚未做出选择
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusRestricted) {
                    [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:true];
                } else if (status == PHAuthorizationStatusDenied) {
                    [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
                } else {
                    // PHAuthorizationStatusAuthorized
                    [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
                }
            }];
        } else if (status == PHAuthorizationStatusRestricted) {
            [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
        } else if (status == PHAuthorizationStatusDenied) {
            [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
        } else {
            // PHAuthorizationStatusAuthorized
            [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
        }
    } else {
        [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:false];
    }
}

//MARK: -相机
+ (void)requestCameraAuthorization:(void(^)(DLAuthorizationStatus status, BOOL isFirstAuthorization))callback {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
                } else {
                    [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
                }
            }];
        } else if (authStatus == AVAuthorizationStatusAuthorized) {
            [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
        } else if (authStatus == AVAuthorizationStatusDenied) {
            [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
        } else if (authStatus == AVAuthorizationStatusRestricted) {
            [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
        }
    } else {
        [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:false];
    }
}
//MARK: - 麦克风
+ (void)requestMicrophoneAuthorization:(void (^)(DLAuthorizationStatus status, BOOL isFirst))callback {
    AVAuthorizationStatus recordAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (recordAuthStatus == AVAuthorizationStatusNotDetermined) {
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            if (granted) {
                [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
            } else {
                [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
            }
        }];
    } else if (recordAuthStatus == AVAuthorizationStatusAuthorized) {
        [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
    } else if (recordAuthStatus == AVAuthorizationStatusDenied) {
        [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
    } else if (recordAuthStatus == AVAuthorizationStatusRestricted) {
        [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
    }
}
//MARK: - 通讯录
+ (void)requestAddressBookAuthorization:(void (^)(DLAuthorizationStatus status, BOOL isFirst))callback {
    if (@available(iOS 9.0, *)) {
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (status == CNAuthorizationStatusNotDetermined) {
            CNContactStore *contactStore = [[CNContactStore alloc] init];
            if (contactStore == NULL) {
                [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
            }
            [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (error) {
                    [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
                } else {
                    if (granted) {
                        [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
                    } else {
                        [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
                    }
                }
            }];
        } else if (status == CNAuthorizationStatusRestricted) {
            [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
        } else if (status == CNAuthorizationStatusDenied) {
            [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
        } else {
            // CNAuthorizationStatusAuthorized
            [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
        }
    }
}

//MARK: - 日历
+ (void)requestCalendarsAuthorization:(void (^)(DLAuthorizationStatus status, BOOL isFirst))callback {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (status == EKAuthorizationStatusNotDetermined) {
        EKEventStore *store = [[EKEventStore alloc] init];
        if (store == NULL) {
            [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
        } else {
            [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
                if (error) {
                    [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
                }
                if (granted) {
                    [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
                } else {
                    [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
                }
            }];
        }
    } else if (status == EKAuthorizationStatusRestricted) {
        [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
    } else if (status == EKAuthorizationStatusDenied) {
        [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
    } else {
        // EKAuthorizationStatusAuthorized
        [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
    }
}

//MARK: - 提醒事项
+ (void)requestRemindersAuthorization:(void (^)(DLAuthorizationStatus status, BOOL isFirst))callback {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];
    if (status == EKAuthorizationStatusNotDetermined) {
        EKEventStore *store = [[EKEventStore alloc] init];
        if (store == NULL) {
            [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
        } else {
            [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
                if (error) {
                    [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
                }
                if (granted) {
                    [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
                }else{
                    [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
                }
            }];
        }
    } else if (status == EKAuthorizationStatusRestricted) {
        [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
    } else if (status == EKAuthorizationStatusDenied) {
        [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
    } else {
        // EKAuthorizationStatusAuthorized
        [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
    }
    
}
//MARK: - 语音识别
+ (void)requestSpeechRecognitionAuthorization:(void (^)(DLAuthorizationStatus status, BOOL isFirst))callback {
    if (@available(iOS 10.0, *)) {
        SFSpeechRecognizerAuthorizationStatus status = [SFSpeechRecognizer authorizationStatus];
        if (status == SFSpeechRecognizerAuthorizationStatusNotDetermined) {
            [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
                if (status == SFSpeechRecognizerAuthorizationStatusNotDetermined) {
                    [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:true];
                } else if (status == SFSpeechRecognizerAuthorizationStatusDenied) {
                    [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:true];
                } else if (status == SFSpeechRecognizerAuthorizationStatusRestricted) {
                    [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:true];
                } else {
                    // SFSpeechRecognizerAuthorizationStatusAuthorized
                    [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:true];
                }
            }];
        } else if (status == SFSpeechRecognizerAuthorizationStatusDenied) {
            [self executeCallback:callback status:DLAuthorizationStatusDenied requestFirst:false];
        } else if (status == SFSpeechRecognizerAuthorizationStatusRestricted) {
            [self executeCallback:callback status:DLAuthorizationStatusRestricted requestFirst:false];
        } else {
            // SFSpeechRecognizerAuthorizationStatusAuthorized
            [self executeCallback:callback status:DLAuthorizationStatusAuthorized requestFirst:false];
        }
    } else {
        
        [self executeCallback:callback status:DLAuthorizationStatusNotSupport requestFirst:false];
    }
}

#pragma mark - callback
+ (void)executeCallback:(void (^)(DLAuthorizationStatus status, BOOL isFirstAuthorization))callback status:(DLAuthorizationStatus)status requestFirst:(BOOL)isFirstAuthorization {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (callback) {
            callback(status, isFirstAuthorization);
        }
    });
}

@end
