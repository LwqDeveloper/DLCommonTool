//
//  NSTimer+DLWeak.h
//  DLCommonTool
//
//  Created by jamelee on 2021/5/7.
//

#import <Foundation/Foundation.h>

@interface NSTimer (DLWeak)

+ (NSTimer *)dl_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats;

@end
