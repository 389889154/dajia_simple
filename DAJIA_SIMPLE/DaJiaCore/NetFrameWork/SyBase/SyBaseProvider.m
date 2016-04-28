//
//  SyBaseProvider.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseProvider.h"

@interface SyBaseProvider ()
@property (nonatomic, assign) float progress;
@end

@implementation SyBaseProvider
- (id)initWithDelegate:(id<SyProviderDelegate>)aDelegate {
    if (self = [super init]) {
        _delegate = aDelegate;
        _storeDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)request:(SyBaseRequest *)request {
    self.request  = request;
}

-(void)cancel {
    //TODOSUB
}

- (NSError *)handleError:(NSObject *)error {
    NSLog(@" provider error ");
    NSError *se = nil;
    if ([error isKindOfClass:([NSError class])]) {
        se = (NSError *)error;
    } else if ([error isKindOfClass:([NSData class])]) {
        NSError *er = nil;
        NSDictionary *dic =
        [NSJSONSerialization JSONObjectWithData:(NSData *)error
                                        options:NSJSONReadingAllowFragments
                                          error:&er];
        if ([dic objectForKey:kServerErrorMessage]) {
            NSDictionary *uInfo = [NSMutableDictionary
                                   dictionaryWithObject:[dic objectForKey:kServerErrorMessage]
                                   forKey:NSLocalizedDescriptionKey];
            if ([dic objectForKey:kServerErrorStack]) {
                [uInfo setValue:[dic objectForKey:kServerErrorStack]
                         forKey:kServerErrorStack];
            }
            if ([dic objectForKey:kServerExceptionID]) {
                [uInfo setValue:[dic objectForKey:kServerExceptionID]
                         forKey:kServerExceptionID];
            }
            
            se = [NSError
                  errorWithDomain:kDajiaErrorDomain
                  code:[[dic objectForKey:kServerErrorCode] integerValue]
                  userInfo:uInfo];
        } else if ([dic objectForKey:kAuthError]) {
            se = [NSError errorWithDomain:kDajiaAuthErrorDomain
                                     code:kAuthErrorInvalidGrant
                                 userInfo:nil];
        }
    }
    return se;
}
@end

// 类目
@implementation SyBaseProvider (Block)
- (void)request:(SyBaseRequest *)request
        handler:(URLRequestStatusHandler)handler {
    _delegate = self;
    self.statusHandler = handler;
    [self request:request];
}

- (void)request:(SyBaseRequest *)request
        handler:(URLRequestStatusHandler)handler
progressHandler:(URLRequestProgressHandler)progressHandler {
    self.progressHandler = progressHandler;
    [self request:request handler:handler];
}

- (void)providerDidFinishLoad:(SyBaseProvider *)provider {
    if (self.statusHandler) {
        self.statusHandler(SyURLRequestFinishedType, provider, nil);
    }
}

- (void)provider:(SyBaseProvider *)provider
didFailLoadWithError:(NSError *)error {
    if (self.statusHandler) {
        self.statusHandler(SyURLRequestFailType, provider, error);
    }
}

- (void)providerDidStartLoad:(SyBaseProvider *)provider {
    if (self.statusHandler) {
        self.statusHandler(SyURLRequestStartType, provider, nil);
    }
}

- (void)provider:(SyBaseProvider *)provider progress:(float)progress {
    provider.progress = progress;
    if (self.statusHandler) {
        self.statusHandler(SyURLRequestProgress, provider, nil);
    }
}

@end
