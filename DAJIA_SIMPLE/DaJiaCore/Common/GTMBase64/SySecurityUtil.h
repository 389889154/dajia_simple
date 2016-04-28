//
//  SySecurityUtil.h
//  Dajia
//
//  Created by zhengxiaofeng on 13-8-19.
//  Copyright (c) 2013年 zhengxiaofeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SySecurityUtil : NSObject
#pragma mark - base64
+ (NSString *)encodeBase64String:(NSString *)input;
+ (NSString *)decodeBase64String:(NSString *)input;
+ (NSString *)encodeBase64Data:(NSData *)data;
+ (NSString *)decodeBase64Data:(NSData *)data;
+ (NSData *)AES256Encrypt:(NSData *)srcData key:(NSString *)key;
+ (NSData *)AES256decrypt:(NSData *)srcData key:(NSString *)key;
@end
