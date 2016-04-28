//
//  NSString+SyString.h
//  DaJiaCore
//
//  Created by zhengxiaofeng on 13-6-24.
//  Copyright (c) 2013年 zhengxiaofeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SyString)

/**
 *  判断字符串是否为空
 *
 *  @param string 检查的字符串
 *
 *  @return BOOL
 */
+ (BOOL)isEmptyString:(NSString *)string;

/**
 * 生成唯一字符串
 */
+ (NSString *)randomUniqueString;

// 替换字符串
- (NSString *)replaceCharacter:(NSString *)oStr withString:(NSString *)nStr;

- (NSString *)replaceCharacterWithSpace;

- (NSString *)replaceCharacterWithString:(NSString *)str;

// 校验 服务端字符串
+ (NSString *)verifySeverStr:(NSString *)str;

//
+ (NSDictionary *)dictionaryFromQuery:(NSString *)query
                        usingEncoding:(NSStringEncoding)encoding;

/*
 *  计算字符串的长度
 **/
- (NSInteger)lengthOfStringMatchChineseAndEnglish;

- (NSInteger)lastCharASCValue;

/**
 *  验证手机号
 *
 *  @return BOOL
 */
- (BOOL)checkPhoneNumInput;

/**
 *  去首尾空格和回车符
 */
- (NSString *)replaceSpaceAndNewline;

- (NSString *)stringByUnescapingEntities;
- (NSString *)stringByescapingEntities;

+ (NSString *)urlencode:(NSString *)input;
+ (NSString *)urldecode:(NSString *)input;

- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font;

@end

@interface NSMutableString(SafeAppend)
- (void)appendString:(NSString *)aString;
- (void)appendStringSafe:(NSString *)aString;
@end