//
//  SyHttpHeaderMakerUtils.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyHttpHeaderMakerUtils.h"
#import "SyBaseRequest.h"
#import "SyServerManager.h"
#import "NSString+SyString.h"
#import "NSObject+JSON.h"
@implementation SyHttpHeaderMakerUtils

+ (NSString *)getGetRequestParmetersStrByDic:(NSDictionary *)parametersDic
                                        type:(NSInteger)type {
    NSMutableString *str = [[NSMutableString alloc] init];
    
    NSString *managerName = [parametersDic objectForKey:kManagerName];
    NSString *methodName = [parametersDic objectForKey:kMethodName];
    if (type == kRequestType_get) {
        [str appendFormat:@"%@/%@/%@",
         [SyServerManager defaultManager].serverAddress,
         managerName, methodName];
    } else if (type == kRequestType_oauth_get) {
        [str appendFormat:@"%@", [SyServerManager defaultManager].oauthAddress];
    } else if (type == kRequestType_openid_get) {
        [str appendFormat:@"%@", [SyServerManager defaultManager].openIDAddress];
    } else if (type == kRequestType_version_get) {
        [str appendFormat:@"%@/%@", [SyServerManager defaultManager].versionAddress,
         methodName];
    } else if (type == kRequestType_baseurl_get) {
        [str appendFormat:@"%@/%@/%@",
         [SyServerManager defaultManager].serverDomain,
         managerName, methodName];
    }
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSDictionary *dic = [parametersDic objectForKey:kArguments];
    for (NSString *key in [dic allKeys]) {
        id value = [dic objectForKey:key];
        
        if ([value isKindOfClass:[NSString class]]) {
            // 为空不拼装
            if (![value isEqual:@""]) {
                NSString *param = value; //[value stringByescapingEntities];
                [array
                 addObject:[NSString stringWithFormat:@"%@=%@", key,
                            [NSString urlencode:param]]];
            }
        } else if ([value isKindOfClass:[NSNumber class]]) {
            NSNumber *number = (NSNumber *)value;
            [array addObject:[NSString
                              stringWithFormat:@"%@=%@", key, number.stringValue]];
        }
    }
    [str appendFormat:@"?%@", [array componentsJoinedByString:@"&"]];
    
    __autoreleasing NSString *result =
    (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                          NULL, (CFStringRef)str, (CFStringRef) @"%", NULL,
                                                                          kCFStringEncodingUTF8);
    return result;
}
+ (NSString *)getPostRequestSeverUrlByDic:(NSDictionary *)parametersDic {
    NSMutableString *str = [[NSMutableString alloc] init];
    
    NSString *managerName = [parametersDic objectForKey:kManagerName];
    NSString *methodName = [parametersDic objectForKey:kMethodName];
    [str appendFormat:@"%@/%@/%@", [SyServerManager defaultManager].serverAddress,
     managerName, methodName];
    return str;
}

+ (NSData *)getPostRequestDataByDic:(NSDictionary *)parametersDic {
    NSString *jsonStr =
    [[parametersDic objectForKey:kArguments] JSONRepresentation];
    NSLog(@"post:jsonStr %@", jsonStr);
    NSLog(@"size:%ld", strlen([jsonStr UTF8String]));
    return [NSData dataWithBytes:[jsonStr UTF8String]
                          length:strlen([jsonStr UTF8String])];
}

@end
