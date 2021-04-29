//
//  DLCommonWebController.h
//  DLCommonTool
//
//  Created by jamelee on 2021/4/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLCommonWebController : UIViewController <WKUIDelegate, WKNavigationDelegate>

/// wk
@property (nonatomic, strong) WKWebView *webView;
//网页加载进度视图
@property (nonatomic, strong) UIProgressView * progressView;

/// title
@property (nonatomic, assign) BOOL needUpdateTitle;
/// progress
@property (nonatomic, assign) BOOL needUpdateProgress;

@end

NS_ASSUME_NONNULL_END
