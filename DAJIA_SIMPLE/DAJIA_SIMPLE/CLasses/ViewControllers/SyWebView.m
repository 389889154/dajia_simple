//
//  SyWebView.m
//  DaJiaCore
//
//  Created by lihz on 4/3/15.
//  Copyright (c) 2015 zhengxiaofeng. All rights reserved.
//

#import "SyWebView.h"

static NSString *bridgeJS = nil;
@interface SyWebView ()
@property(nonatomic, strong) WebViewJavascriptBridge *webBridge;
@end

@implementation SyWebView

- (instancetype)init {
  self = [super init];
  if (self) {
    [WebViewJavascriptBridge enableLogging];
    _webBridge = [WebViewJavascriptBridge
        bridgeForWebView:self
                 handler:^(id data, WVJBResponseCallback responseCallback) {
                   NSLog(@"收到未注册的消息：%@", data);
                   responseCallback([NSString
                       stringWithFormat:
                           @"收到未注册的消息（%@）已处理", data]);
                 }];
  }
  return self;
}

- (void)setBridgeDelegate:(id<UIWebViewDelegate>)delegate {
  _webBridge.webViewDelegate = delegate;
}

- (void)registerHandler:(const NSString *)handlerName
                handler:(WVJBHandler)handler {
  [_webBridge registerHandler:handlerName handler:handler];
}

- (BOOL)isExistFunName:(NSString *)funName {
  return [_webBridge isExistFunName:funName];
}
@end

#if __has_feature(objc_arc_weak)
#define WVJB_WEAK __weak
#else
#define WVJB_WEAK __unsafe_unretained
#endif

typedef NSDictionary WVJBMessage;

@implementation WebViewJavascriptBridge {
  WVJB_WEAK WVJB_WEBVIEW_TYPE *_webView;
  NSMutableArray *_startupMessageQueue;
  NSMutableDictionary *_responseCallbacks;
  NSMutableDictionary *_messageHandlers;
  long _uniqueId;
  WVJBHandler _messageHandler;

  NSBundle *_resourceBundle;

#if defined WVJB_PLATFORM_IOS
  NSUInteger _numRequestsLoading;
#endif
}

/* API
 *****/

static bool logging = false;
+ (void)enableLogging {
  logging = true;
}

+ (instancetype)bridgeForWebView:(WVJB_WEBVIEW_TYPE *)webView
                         handler:(WVJBHandler)handler {
  return [self bridgeForWebView:webView webViewDelegate:nil handler:handler];
}

+ (instancetype)bridgeForWebView:(WVJB_WEBVIEW_TYPE *)webView
                 webViewDelegate:(WVJB_WEBVIEW_DELEGATE_TYPE *)webViewDelegate
                         handler:(WVJBHandler)messageHandler {
  return [self bridgeForWebView:webView
                webViewDelegate:webViewDelegate
                        handler:messageHandler
                 resourceBundle:nil];
}

+ (instancetype)bridgeForWebView:(WVJB_WEBVIEW_TYPE *)webView
                 webViewDelegate:(WVJB_WEBVIEW_DELEGATE_TYPE *)webViewDelegate
                         handler:(WVJBHandler)messageHandler
                  resourceBundle:(NSBundle *)bundle {
  WebViewJavascriptBridge *bridge = [[WebViewJavascriptBridge alloc] init];
  [bridge _platformSpecificSetup:webView
                 webViewDelegate:webViewDelegate
                         handler:messageHandler
                  resourceBundle:bundle];
  return bridge;
}

- (void)send:(id)data {
  [self send:data responseCallback:nil];
}

- (void)send:(id)data responseCallback:(WVJBResponseCallback)responseCallback {
  [self _sendData:data responseCallback:responseCallback handlerName:nil];
}

- (void)callHandler:(NSString *)handlerName {
  [self callHandler:handlerName data:nil responseCallback:nil];
}

- (void)callHandler:(NSString *)handlerName data:(id)data {
  [self callHandler:handlerName data:data responseCallback:nil];
}

- (void)callHandler:(NSString *)handlerName
               data:(id)data
   responseCallback:(WVJBResponseCallback)responseCallback {
  [self _sendData:data
      responseCallback:responseCallback
           handlerName:handlerName];
}

- (void)registerHandler:(const NSString *)handlerName
                handler:(WVJBHandler)handler {
  _messageHandlers[handlerName] = [handler copy];
}

- (BOOL)isExistFunName:(NSString *)funName {
  for (NSString *handlerName in _messageHandlers.allKeys) {
    if ([funName isEqualToString:handlerName]) {
      return YES;
    }
  }
  return NO;
}

/* Platform agnostic internals
 *****************************/

- (id)init {
  if (self = [super init]) {
    _startupMessageQueue = [NSMutableArray array];
    _responseCallbacks = [NSMutableDictionary dictionary];
    _uniqueId = 0;
  }
  return self;
}

- (void)dealloc {
  [self _platformSpecificDealloc];

  _webView = nil;
  _webViewDelegate = nil;
  _startupMessageQueue = nil;
  _responseCallbacks = nil;
  _messageHandlers = nil;
  _messageHandler = nil;
}

- (void)_sendData:(id)data
 responseCallback:(WVJBResponseCallback)responseCallback
      handlerName:(NSString *)handlerName {
  NSMutableDictionary *message = [NSMutableDictionary dictionary];

  if (data) {
    message[@"data"] = data;
  }

  if (responseCallback) {
    NSString *callbackId =
        [NSString stringWithFormat:@"objc_cb_%ld", ++_uniqueId];
    _responseCallbacks[callbackId] = [responseCallback copy];
    message[@"callbackId"] = callbackId;
  }

  if (handlerName) {
    message[@"handlerName"] = handlerName;
  }
  [self _queueMessage:message];
}

- (void)_queueMessage:(WVJBMessage *)message {
  if (_startupMessageQueue) {
    [_startupMessageQueue addObject:message];
  } else {
    [self _dispatchMessage:message];
  }
}

- (void)_dispatchMessage:(WVJBMessage *)message {
  NSString *messageJSON = [self _serializeMessage:message];
  [self _log:@"SEND" json:messageJSON];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\\"
                                                       withString:@"\\\\"];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\""
                                                       withString:@"\\\""];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\'"
                                                       withString:@"\\\'"];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\n"
                                                       withString:@"\\n"];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\r"
                                                       withString:@"\\r"];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\f"
                                                       withString:@"\\f"];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\u2028"
                                                       withString:@"\\u2028"];
  messageJSON = [messageJSON stringByReplacingOccurrencesOfString:@"\u2029"
                                                       withString:@"\\u2029"];

  NSString *javascriptCommand =
      [NSString stringWithFormat:@"djInternal._handleMessageFromObjC('%@');",
                                 messageJSON];
  if ([[NSThread currentThread] isMainThread]) {
    [_webView stringByEvaluatingJavaScriptFromString:javascriptCommand];
  } else {
    __strong WVJB_WEBVIEW_TYPE *strongWebView = _webView;
    dispatch_sync(dispatch_get_main_queue(), ^{
      [strongWebView stringByEvaluatingJavaScriptFromString:javascriptCommand];
    });
  }
}

- (void)_flushMessageQueue {
  NSString *messageQueueString = [_webView
      stringByEvaluatingJavaScriptFromString:@"djInternal._fetchQueue();"];

  id messages = [self _deserializeMessageJSON:messageQueueString];
  if (![messages isKindOfClass:[NSArray class]]) {
    NSLog(@"djInternal: WARNING: Invalid %@ received: %@", [messages class],
              messages);
    return;
  }
  for (WVJBMessage *message in messages) {
    if (![message isKindOfClass:[WVJBMessage class]]) {
      NSLog(@"djInternal: WARNING: Invalid %@ received: %@",
                [message class], message);
      continue;
    }
    [self _log:@"RCVD" json:message];

    NSString *responseId = message[@"responseId"];
    if (responseId) {
      WVJBResponseCallback responseCallback = _responseCallbacks[responseId];
      responseCallback(message[@"responseData"]);
      [_responseCallbacks removeObjectForKey:responseId];
    } else {
      WVJBResponseCallback responseCallback = NULL;
      NSString *callbackId = message[@"callbackId"];
      if (callbackId) {
        responseCallback = ^(id responseData) {
          if (responseData == nil) {
            responseData = [NSNull null];
          }

          WVJBMessage *msg = @{
            @"responseId" : callbackId,
            @"responseData" : responseData
          };
          [self _queueMessage:msg];
        };
      } else {
        responseCallback = ^(id ignoreResponseData) {
          // Do nothing
        };
      }

      WVJBHandler handler;
      if (message[@"handlerName"]) {
        handler = _messageHandlers[message[@"handlerName"]];
      } else {
        handler = _messageHandler;
      }

      if (!handler) {
        [NSException raise:@"WVJBNoHandlerException"
                    format:@"No handler for message from JS: %@", message];
      }

      handler(message[@"data"], responseCallback);
    }
  }
}

- (NSString *)_serializeMessage:(id)message {
  return [[NSString alloc]
      initWithData:
          [NSJSONSerialization dataWithJSONObject:message options:0 error:nil]
          encoding:NSUTF8StringEncoding];
}

- (NSArray *)_deserializeMessageJSON:(NSString *)messageJSON {
  return [NSJSONSerialization
      JSONObjectWithData:[messageJSON dataUsingEncoding:NSUTF8StringEncoding]
                 options:NSJSONReadingAllowFragments
                   error:nil];
}

- (void)_log:(NSString *)action json:(id)json {
  if (!logging) {
    return;
  }
  if (![json isKindOfClass:[NSString class]]) {
    json = [self _serializeMessage:json];
  }
  if ([json length] > 500) {
    NSLog(@"WVJB %@: %@ [...]", action, [json substringToIndex:500]);
  } else {
    NSLog(@"WVJB %@: %@", action, json);
  }
}

/* Platform specific internals: iOS
 **********************************/
#if defined WVJB_PLATFORM_IOS

- (void)_platformSpecificSetup:(WVJB_WEBVIEW_TYPE *)webView
               webViewDelegate:(id<UIWebViewDelegate>)webViewDelegate
                       handler:(WVJBHandler)messageHandler
                resourceBundle:(NSBundle *)bundle {
  _messageHandler = messageHandler;
  _webView = webView;
  _webViewDelegate = webViewDelegate;
  _messageHandlers = [NSMutableDictionary dictionary];
  _webView.delegate = self;
  _resourceBundle = bundle;
}

- (void)_platformSpecificDealloc {
  _webView.delegate = nil;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  if (webView != _webView) {
    return;
  }

  _numRequestsLoading--;

  if (_numRequestsLoading == 0 &&
      ![[webView stringByEvaluatingJavaScriptFromString:
                     @"typeof djInternal == 'object'"]
          isEqualToString:@"true"]) {
        if(nil == bridgeJS){
          NSBundle *bundle =
          _resourceBundle ? _resourceBundle : [NSBundle mainBundle];
          NSString *filePath = [bundle pathForResource:@"DajiaInternal" ofType:@"js"];
          bridgeJS = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUTF8StringEncoding
                                                      error:nil];
        }

    [webView stringByEvaluatingJavaScriptFromString:bridgeJS];
#ifdef DEBUG
//      NSString *otherJS = @"da.showPicList = function(v){"
//                          @"	if(this.canTrans())"
//                          @"	  djInternal.callHandler('showPicList',"
//                          @"	           {'current':v.current,'ids':v.ids});"
//                          @"	};"
//                          @"da.showFile = function(v){"
//                          @"	if(this.canTrans())"
//                          @"		djInternal.callHandler('showFile',
//                          {'fileID':v.fileID,'fileName':v.fileName,'fileSize':v.fileSize});"
//                          @"};"
//                          @"da.showPerson = function(v){"
//                          @"	if(this.canTrans())"
//                          @"		djInternal.callHandler('showPerson',
//                          {'personID':v.personID,'communityID':v.communityID});"
//                          @"};"
//                          @"da.showGroup = function(v){"
//                          @"	if(this.canTrans())"
//                          @"		djInternal.callHandler('showGroup',
//                          {'groupID':v.groupID,'communityID':v.communityID});"
//                          @"};"
//                          @"da.AddImgClickEvent = function()"
//                          @"{"
//                          @"    var objs =
//                          document.getElementsByTagName('img');"
//                          @"    for(var i=0;i<objs.length;i++)"
//                          @"    {"
//                          @"        objs[i].onclick=function()"
//                          @"        {"
//                          @"            var fileInfo = {"
//                          @"                current : 3,"
//                          @"                ids :
//                          '123,12312,1242534,1452356346'"
//                          @"            };"
//                          @"            da.showPicList(fileInfo);"
//                          @"            var personInfo = {"
//                          @"                personID : 'personID',"
//                          @"                communityID : 'communityID'"
//                          @"            };"
//                          @"            da.showPerson(personInfo);"
//                          @"            var groupInfo = {"
//                          @"                groupID : 'groupID',"
//                          @"                communityID : 'communityID'"
//                          @"            };"
//                          @"            da.showGroup(groupInfo);"
//                          @"            var fileInfo = {"
//                          @"                fileID : 'fileID',"
//                          @"                fileName : 'fileName',"
//                          @"                fileSize : 'fileSize'"
//                          @"            };"
//                          @"            da.showFile(fileInfo);"
//                          @"        };"
//                          @"        objs[i].style.cursor = 'pointer';"
//                          @"    }"
//                          @"};"
//                          @"da.AddImgClickEvent();";
//      [webView stringByEvaluatingJavaScriptFromString:otherJS];
//      NSString *otherJS1 =
//      [webView stringByEvaluatingJavaScriptFromString:otherJS1];
#endif
  }

  if (_startupMessageQueue) {
    for (id queuedMessage in _startupMessageQueue) {
      [self _dispatchMessage:queuedMessage];
    }
    _startupMessageQueue = nil;
  }

  __strong WVJB_WEBVIEW_DELEGATE_TYPE *strongDelegate = _webViewDelegate;
  if (strongDelegate &&
      [strongDelegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
    [strongDelegate webViewDidFinishLoad:webView];
  }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  if (webView != _webView) {
    return;
  }

  _numRequestsLoading--;

  __strong WVJB_WEBVIEW_DELEGATE_TYPE *strongDelegate = _webViewDelegate;
  if (strongDelegate &&
      [strongDelegate
          respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
    [strongDelegate webView:webView didFailLoadWithError:error];
  }
}

- (BOOL)webView:(UIWebView *)webView
    shouldStartLoadWithRequest:(NSURLRequest *)request
                navigationType:(UIWebViewNavigationType)navigationType {
  if (webView != _webView) {
    return YES;
  }
  NSURL *url = [request URL];
  __strong WVJB_WEBVIEW_DELEGATE_TYPE *strongDelegate = _webViewDelegate;
  if ([[url scheme] isEqualToString:kCustomProtocolScheme]) {
    if ([[url host] isEqualToString:kQueueHasMessage]) {
      [self _flushMessageQueue];
    } else {
      NSLog(@"djInternal: WARNING: Received unknown djInternal command %@://%@",
            kCustomProtocolScheme, [url path]);
    }
    return NO;
  } else if (strongDelegate &&
             [strongDelegate
                 respondsToSelector:@selector(webView:
                                        shouldStartLoadWithRequest:
                                                    navigationType:)]) {
    return [strongDelegate webView:webView
        shouldStartLoadWithRequest:request
                    navigationType:navigationType];
  } else {
    return YES;
  }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
  if (webView != _webView) {
    return;
  }

  _numRequestsLoading++;

  __strong WVJB_WEBVIEW_DELEGATE_TYPE *strongDelegate = _webViewDelegate;
  if (strongDelegate &&
      [strongDelegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
    [strongDelegate webViewDidStartLoad:webView];
  }
}

#endif

@end
