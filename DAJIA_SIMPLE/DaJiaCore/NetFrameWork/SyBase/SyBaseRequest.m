//
//  SyBaseRequest.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseRequest.h"
#import "SyServerManager.h"
#import "SyHttpHeaderMakerUtils.h"
@implementation SyBaseRequest
@synthesize managerName = _managerName;
@synthesize methodName = _methodName;
@synthesize requestType = _requestType;

- (id)init {
    self = [super init];
    if (self) {
        if (!_parametersDic) {
            _parametersDic = [[NSMutableDictionary alloc] init];
        }
    }
    return self;
}

- (instancetype)initWithURL:(NSString *)url {
    id instance = [self init];
    _url = url;
    return instance;
}

- (NSString *)url {
    if (_url) {
        return _url;
    } else {
        if (kRequestType_post == _requestType) {
            return [SyHttpHeaderMakerUtils
                    getPostRequestSeverUrlByDic:[self parametersDic]];
        } else {
            return [SyHttpHeaderMakerUtils
                    getGetRequestParmetersStrByDic:[self parametersDic]
                    type:_requestType];
        }
    }
}

- (NSData *)postData  {
    NSParameterAssert(_requestType == kRequestType_post);
    return [SyHttpHeaderMakerUtils getPostRequestDataByDic:[self parametersDic]];
}

- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key {
    [_parametersDic setValue:[NSNumber numberWithInteger:value] forKey:key];
}

- (void)setLongLongValue:(long long)value forKey:(NSString *)key {
    [_parametersDic setValue:[NSNumber numberWithLongLong:value] forKey:key];
}

- (void)setBOOLValue:(BOOL)value forKey:(NSString *)key {
    [_parametersDic setValue:[NSNumber numberWithBool:value] forKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if (!value) {
        value = [NSNull null];
    }
    [_parametersDic setValue:value forKey:key];
}

- (NSDictionary *)parametersDic {
    if (_requestType == kRequestType_get || _requestType == kRequestType_post) {
        if ([SyCacheManager sharedSyCacheManager].accessToken) {
            [_parametersDic
             setObject:[SyCacheManager sharedSyCacheManager].accessToken
             forKey:@"access_token"];
        }
    }
    [_parametersDic setObject:SY_APP_SHORTVERSION forKey:@"version"];
    NSDictionary *result = [NSDictionary
                            dictionaryWithObjectsAndKeys:_managerName, kManagerName, _methodName,
                            kMethodName, _parametersDic, kArguments,
                            nil];
    
    return result;
}
@end
