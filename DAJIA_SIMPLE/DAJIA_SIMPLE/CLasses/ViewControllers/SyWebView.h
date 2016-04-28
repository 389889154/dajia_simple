//
//  SyWebView.h
//  DaJiaCore
//
//  Created by lihz on 4/3/15.
//  Copyright (c) 2015 zhengxiaofeng. All rights reserved.
//

#import <UIKit/UIKit.h>
static const NSString *SyJSGetPic = @"getPic";
static const NSString *SyJSCreateWindow = @"createWindow";
static const NSString *SyJSShowMessage = @"showMessage";

typedef void (^WVJBResponseCallback)(id responseData);
typedef void (^WVJBHandler)(id data, WVJBResponseCallback responseCallback);

@interface SyWebView : UIWebView
- (void)setBridgeDelegate:(id<UIWebViewDelegate>)delegate;
- (void)registerHandler:(const NSString *)handlerName
                handler:(WVJBHandler)handler;
- (BOOL)isExistFunName:(NSString *)funName;
@end

#define kCustomProtocolScheme @"djinternalscheme"
#define kQueueHasMessage @"__DJINTERNAL_QUEUE_MESSAGE__"

#if defined __MAC_OS_X_VERSION_MAX_ALLOWED
#import <WebKit/WebKit.h>


#define WVJB_PLATFORM_OSX
#define WVJB_WEBVIEW_TYPE WebView
#define WVJB_WEBVIEW_DELEGATE_TYPE NSObject
#elif defined __IPHONE_OS_VERSION_MAX_ALLOWED
#import <UIKit/UIWebView.h>
#define WVJB_PLATFORM_IOS
#define WVJB_WEBVIEW_TYPE UIWebView
#define WVJB_WEBVIEW_DELEGATE_TYPE NSObject<UIWebViewDelegate>
#endif

@interface WebViewJavascriptBridge : WVJB_WEBVIEW_DELEGATE_TYPE
@property(nonatomic, weak) id webViewDelegate;


+ (instancetype)bridgeForWebView:(WVJB_WEBVIEW_TYPE *)webView
                         handler:(WVJBHandler)handler;
+ (instancetype)bridgeForWebView:(WVJB_WEBVIEW_TYPE *)webView
                 webViewDelegate:(WVJB_WEBVIEW_DELEGATE_TYPE *)webViewDelegate
                         handler:(WVJBHandler)handler;
+ (instancetype)bridgeForWebView:(WVJB_WEBVIEW_TYPE *)webView
                 webViewDelegate:(WVJB_WEBVIEW_DELEGATE_TYPE *)webViewDelegate
                         handler:(WVJBHandler)handler
                  resourceBundle:(NSBundle *)bundle;
+ (void)enableLogging;

- (void)send:(id)message;
- (void)send:(id)message
    responseCallback:(WVJBResponseCallback)responseCallback;
- (void)registerHandler:(const NSString *)handlerName
                handler:(WVJBHandler)handler;
- (void)callHandler:(NSString *)handlerName;
- (void)callHandler:(NSString *)handlerName data:(id)data;
- (void)callHandler:(NSString *)handlerName
               data:(id)data
   responseCallback:(WVJBResponseCallback)responseCallback;
- (BOOL)isExistFunName:(NSString *)funName;
@end
