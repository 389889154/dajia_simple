//
//  SyURLConnection.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyURLConnection.h"
#import "SyBaseRequest.h"
#import "SyHttpHeaderMakerUtils.h"
#define kTimeOut 30
#define kTimeOutPost 30
@implementation SyURLConnection

- (void)dealloc {
    if (_connection) {
        [_connection cancel];
    }
}

- (void)cancel {
    if (_connection) {
        [_connection cancel];
    }
    _isResponse = YES;
    _delegate = nil;
}

- (id)initWithDelegate:(id)aDelegate {
    if (self = [super init]) {
        _delegate = aDelegate;
        _userInfo = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)startRequestWithUrl:(NSString *)serverUrl {
    self.responseData = [[NSMutableData alloc]init];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setTimeoutInterval:kTimeOut];
    
    if (_requestType == kRequestType_get) {
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:serverUrl]];
    }else if (_requestType == kRequestType_post){
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:_postRequestData];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSString *dataLength =
        [NSString stringWithFormat:@"%ld", (long)_postRequestData.length];
        [request setValue:dataLength forHTTPHeaderField:@"Content-Length"];
        
        // zhengxf modify 2014.06.25
        //        [NSTimer scheduledTimerWithTimeInterval:kTimeOutPost target: self
        //        selector: @selector(handleTimer) userInfo:nil repeats:NO];
        //        _isResponse = NO;
        
    }else if (_requestType == kRequestType_oauth_get){
        [request setHTTPMethod:@"GET"];
        [request setValue:[NSString stringWithFormat:@"Basic %@", _authorizationStr]
       forHTTPHeaderField:@"Authorization"];
        [request setURL:[NSURL URLWithString:serverUrl]];
    } else if (_requestType == kRequestType_openid_get){
        [request setHTTPMethod:@"GET"];
        [request setValue:[NSString stringWithFormat:@"Basic %@", _authorizationStr]
       forHTTPHeaderField:@"Authorization"];
        [request setURL:[NSURL URLWithString:serverUrl]];
    }
    
    
    if (_cokiesFlag) {
        [request setHTTPShouldHandleCookies:NO];
    }
    
    if (_connection) {
        [_connection cancel];
    }
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (_delegate &&
        [_delegate respondsToSelector:@selector(urlConnectionStart:)]) {
        [_delegate urlConnectionStart:self];
    }

    NSLog(@"===%ld访问 ===%@",_requestType,serverUrl);
}

#pragma mark - NSURLConnectionDelegate/NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    _isResponse = YES;
    if (_delegate &&
        [_delegate
         respondsToSelector:@selector(urlConnectionDidFailWithError:error:)]) {
            [_delegate performSelector:@selector(urlConnectionDidFailWithError:error:)
                            withObject:self
                            withObject:error];
        }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    _statusCode = [(NSHTTPURLResponse *)response statusCode];
    NSLog(@"Response status:%ld", (long)_statusCode);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    _isResponse = YES;
    NSLog(@"Response %@",[[NSString alloc]initWithData:_responseData encoding:NSUTF8StringEncoding]);
    
    if (_statusCode != 200 && _statusCode != 201) {
        NSLog(@"网络错误：%@",IntegerNumber(_statusCode));
        if (_delegate &&
            [_delegate
             respondsToSelector:@selector(urlConnectionDidFailWithError:
                                          error:)]) {
                 [_delegate performSelector:@selector(urlConnectionDidFailWithError:error:)
                                 withObject:self
                                 withObject:_responseData];
             }
    } else {
        if (_delegate &&
            [_delegate respondsToSelector:@selector(urlConnectionDidFinished:)]) {
            [_delegate urlConnectionDidFinished:self];
        }
    }
}
// 处理SLL证书问题 必须
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:
(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod
            isEqualToString:NSURLAuthenticationMethodServerTrust];
}


- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:
(NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        [challenge.sender useCredential:[NSURLCredential
                                         credentialForTrust:challenge
                                         .protectionSpace
                                         .serverTrust]
             forAuthenticationChallenge:challenge];
    }
    [challenge.sender
     continueWithoutCredentialForAuthenticationChallenge:challenge];
}

- (void)handleTimer {
    if (!_isResponse) {
        NSLog(@"Connection failed: %@", @"Error: timeout");
        if (_connection) {
            [_connection cancel];
        }
        if (_delegate &&
            [_delegate
             respondsToSelector:@selector(urlConnectionDidFailWithError:
                                          error:)]) {
                 [_delegate performSelector:@selector(urlConnectionDidFailWithError:error:)
                                 withObject:self
                                 withObject:[NSError errorWithDomain:NSURLErrorDomain
                                                                code:NSURLErrorTimedOut
                                                            userInfo:nil]];
             }
    }
}
@end
