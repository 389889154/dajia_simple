//
//  SyHttpHeaderMakerUtils.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyHttpHeaderMakerUtils : NSObject
+ (NSString *)getGetRequestParmetersStrByDic:(NSDictionary *)parametersDic type:(NSInteger)type;
+ (NSData *)getPostRequestDataByDic:(NSDictionary *)parametersDic;
+ (NSString *)getPostRequestSeverUrlByDic:(NSDictionary *)parametersDic;

@end
