//
//  NSData+DLExtend.m
//  DLCommonModule_Example
//
//  Created by jamelee on 2020/10/29.
//  Copyright © 2020 lee_weiqiong@163.com. All rights reserved.
//

#import "NSData+DLExtend.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (DLExtend)

- (NSString *)MD5String
{
    unsigned char result[16];
    const char *imageStr = [self bytes];
    CC_MD5(imageStr, (CC_LONG)([self length]), result);
    NSString *imageHash = [NSString stringWithFormat:
                           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                           result[0], result[1], result[2], result[3],
                           result[4], result[5], result[6], result[7],
                           result[8], result[9], result[10], result[11],
                           result[12], result[13], result[14], result[15]
                           ];
    return imageHash;
}

- (NSString *)writeDocumentsFolderName:(NSString *)folderName fileName:(NSString *)fileName
{
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    } else {
        [fileManager removeItemAtPath:[path stringByAppendingPathComponent:fileName] error:nil];
    }
    NSString *urlName = [path stringByAppendingPathComponent:fileName];
    BOOL isWrite = [self writeToFile:urlName atomically:YES];
    return isWrite?urlName:nil;
}

@end
