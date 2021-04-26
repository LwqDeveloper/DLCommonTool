//
//  NSData+DLExtend.h
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DLExtend)

- (NSString *)MD5String;

- (NSString *)writeDocumentsFolderName:(NSString *)folderName fileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
