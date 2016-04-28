//
//  SyURLProvider.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyURLProvider.h"
#import "SyBaseRequest.h"
#import "SyHttpHeaderMakerUtils.h"
#import "SyLoginRequest.h"
#import "SySecurityUtil.h"
#import "NSString+SyString.h"
#ifdef SyURLProvider
#undef SyURLProvider
#endif
#define kUserInfoRequestName @"UserInfoRequestName"

@implementation SyURLProvider
- (void)dealloc {
    [_urlConnection cancel];
}

- (void)cancel {
    [_urlConnection cancel];
}

- (void)request:(SyBaseRequest *)request {
    [super request:request];
    
    if (_urlConnection) {
        [_urlConnection cancel];
        _urlConnection = nil;
    }
    _urlConnection = [[SyURLConnection alloc] initWithDelegate:self];
    _urlConnection.requestType = request.requestType;
    
    if (request.requestType == kRequestType_get) {
        [_urlConnection startRequestWithUrl:request.url];
    } else if (request.requestType == kRequestType_post) {
        _urlConnection.postRequestData = request.postData;
        [_urlConnection startRequestWithUrl:request.url];
    } else if (request.requestType == kRequestType_oauth_get) {
        _urlConnection.authorizationStr =
        [SySecurityUtil encodeBase64String:@"esnMobileClient:esnMobile"];
        [_urlConnection startRequestWithUrl:request.url];
    } else if (request.requestType == kRequestType_openid_get) {
        _urlConnection.authorizationStr =
        [SySecurityUtil encodeBase64String:@"esnMobileClient:esnMobile"];
        [_urlConnection startRequestWithUrl:request.url];
    } else if (request.requestType == kRequestType_version_get) {
        _urlConnection.requestType = kRequestType_get;
        [_urlConnection startRequestWithUrl:request.url];
    } else if (request.requestType == kRequestType_baseurl_get) {
        _urlConnection.requestType = kRequestType_get;
        [_urlConnection startRequestWithUrl:request.url];
    }
    
    //日志 log
    NSString *rName = [NSString
                       stringWithFormat:@"%@/%@", request.managerName, request.methodName];
    long long lengh = 0;
    
    if (_urlConnection.postRequestData) {
        lengh = [_urlConnection.postRequestData length];
    }
//    [MobileMonitor sendRequest:rName andLength:lengh];
    [_urlConnection.userInfo setObject:rName forKey:kUserInfoRequestName];
}

#pragma mark - SyURLConnectionDelegate
- (void)urlConnectionDidFailWithError:(SyURLConnection *)connection
                                error:(NSObject *)error {
    if (_delegate && [_delegate respondsToSelector:@selector(provider:
                                                             didFailLoadWithError:)]) {
        [_delegate provider:self didFailLoadWithError:[super handleError:error]];
    }
}

- (void)urlConnectionDidFinished:(SyURLConnection *)connection {
    //日志 log
    NSString *rName = [connection.userInfo objectForKey:kUserInfoRequestName];
    long long lengh = 0;
    if (connection.responseData) {
        lengh = [connection.responseData length];
    }
//    [MobileMonitor recieveResponse:rName andLength:lengh];
    
    NSError *error = nil;
    id jsonObject =
    [NSJSONSerialization JSONObjectWithData:connection.responseData
                                    options:NSJSONReadingAllowFragments
                                      error:&error];
    
    if (jsonObject != nil && error == nil) {
        @try {
            NSString *responseClass =
            [NSStringFromClass([_request class]) replaceCharacter:@"Request"
                                                       withString:@"Response"];
            _response = [[NSClassFromString(responseClass) alloc]
                         initWithDictionary:jsonObject];
            if (!_response) {
                _response = [NSClassFromString(@"SyBaseResponse") alloc];
            }
        } @catch (NSException *exception) {
            NSLog(@"%@", exception.description);
        } @finally {
            [_response setResponseData:connection.responseData];
        }
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
    if (_delegate &&
        [_delegate respondsToSelector:@selector(providerDidFinishLoad:)]) {
        [_delegate providerDidFinishLoad:self];
    }
}

- (void)urlConnectionStart:(SyURLConnection *)connection {
    if (_delegate &&
        [_delegate respondsToSelector:@selector(providerDidStartLoad:)]) {
        [_delegate providerDidStartLoad:self];
    }
}

@end
