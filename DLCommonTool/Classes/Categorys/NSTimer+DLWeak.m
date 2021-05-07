//
//  NSTimer+DLWeak.m
//  DLCommonTool
//
//  Created by jamelee on 2021/5/7.
//

#import "NSTimer+DLWeak.h"

@implementation NSTimer (DLWeak)

+ (NSTimer *)dl_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(dl_blockSelector:) userInfo:[block copy] repeats:repeats];
}

+ (void)dl_blockSelector:(NSTimer *)timer {
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
