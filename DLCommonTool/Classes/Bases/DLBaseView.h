//
//  DLBaseView.h
//  DLCommonTool
//
//  Created by jamelee on 2021/5/13.
//

#import <UIKit/UIKit.h>

@interface DLBaseView : UIView

- (void)dl_addBgView;

- (void)dl_removeBgView;

- (void)dl_showInView:(UIView *)view;

- (void)dl_hide;

- (void)dl_resetView:(UIView *)view
            frameKey:(NSString *)frameKey
               value:(CGFloat)value;

@end
