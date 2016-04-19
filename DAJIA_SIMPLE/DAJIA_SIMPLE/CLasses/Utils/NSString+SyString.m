//
//  NSString+SyString.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "NSString+SyString.h"

@implementation NSString (SyString)


+ (BOOL)isEmptyString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)replaceCharacter:(NSString *)oStr withString:(NSString *)nStr {
    if (oStr && nStr) {
        NSMutableString *_str = [NSMutableString stringWithString:self];
        [_str replaceOccurrencesOfString:oStr
                              withString:nStr
                                 options:NSCaseInsensitiveSearch
                                   range:NSMakeRange(0, _str.length)];
        return _str;
    } else
        return oStr;
}

- (NSString *)replaceCharacterWithSpace {
    return [self replaceCharacterWithString:@" "];
}

- (NSString *)replaceCharacterWithString:(NSString *)str {
    NSString *_str = self;
    _str = [_str replaceCharacter:@"\n" withString:str];
    _str = [_str replaceCharacter:@"\r" withString:str];
    _str = [_str replaceCharacter:@"\t" withString:str];
    _str = [_str replaceCharacter:@"\b" withString:str];
    _str = [_str replaceCharacter:@"\"" withString:str];
    _str = [_str replaceCharacter:@"'" withString:str];
    _str = [_str replaceCharacter:@"\\" withString:str];
    return _str;
}

+ (NSString *)verifySeverStr:(NSString *)str {
    if (str == nil || [str isEqualToString:@""]) {
        return nil;
    } else {
        // 去掉空格
        NSString *resoultStr =
        [str stringByTrimmingCharactersInSet:[NSCharacterSet
                                              whitespaceCharacterSet]];
        if ([resoultStr isEqualToString:@""]) {
            return nil;
        } else {
            return resoultStr;
        }
    }
}

+ (NSString *)randomUniqueString {
    //  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //  [dateFormatter setDateFormat:@"yyMMddHHmmss"];
    //  NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    //  int randomValue =arc4random() %[ dateString length];
    //  NSString *unique = [NSString stringWithFormat:@"%@.%d",dateString,randomValue];
    //  return unique;
    
    //  [[NSCalendarDate calendarDate] descriptionWithCalendarFormat:@"%m%d%Y%H%M%S%F"];
    
    CFUUIDRef uuidRef =CFUUIDCreate(NULL);
    
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *uniqueId = (__bridge NSString *)uuidStringRef;
    return uniqueId;
}

+ (NSDictionary *)dictionaryFromQuery:(NSString *)query
                        usingEncoding:(NSStringEncoding)encoding {
    NSCharacterSet *delimiterSet =
    [NSCharacterSet characterSetWithCharactersInString:@"?&;"];
    NSMutableDictionary *pairs = [NSMutableDictionary dictionary];
    
    NSScanner *scanner = [[NSScanner alloc] initWithString:query];
    while (![scanner isAtEnd]) {
        NSString *pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count >= 2) {
            NSString *key = [kvPair objectAtIndex:0];
            __autoreleasing NSString *value = (__bridge_transfer NSString *)
            CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                    NULL, (CFStringRef)[kvPair objectAtIndex:1], CFSTR(""), encoding);
            if (value) {
                [pairs setObject:value forKey:key];
            } else {
                [pairs setValue:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}

- (NSInteger)lengthOfStringMatchChineseAndEnglish {
    NSInteger length = 0;
    if (!self) {
        return length;
    }
    for (int i = 0; i < [self length]; i++) {
        if ([self characterAtIndex:i] < 0 || [self characterAtIndex:i] > 127) {
            //中文
            length += 2;
        } else {
            length += 1;
        }
    }
    return length;
}

- (NSInteger)lastCharASCValue {
    if (!self) {
        return -1;
    }
    if (self && self.length > 0) {
        return [self characterAtIndex:0];
    } else {
        return -1;
    }
}

- (BOOL)checkPhoneNumInput {
    NSString *MOBILE = @"^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\\d{8}$";
    NSPredicate *regextestmobile =
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    BOOL res = [regextestmobile evaluateWithObject:self];
    if (res) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *)replaceSpaceAndNewline {
    NSCharacterSet *whitespace =
    [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:whitespace];
}

- (NSString *)stringByUnescapingEntities {
    NSString *string =
    [self stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string =
    [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string =
    [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    string =
    [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string =
    [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    return string;
}

- (NSString *)stringByescapingEntities {
    NSString *string =
    [self stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
    string = [string stringByReplacingOccurrencesOfString:@"%" withString:@"%25"];
    return string;
}

+ (NSString *)urlencode:(NSString *)input {
    NSString *outputStr =
    (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                 NULL,                              /* allocator */
                                                                 (__bridge CFStringRef)input, NULL, /* charactersToLeaveUnescaped */
                                                                 (CFStringRef) @"+&", kCFStringEncodingUTF8);
    //@"!*'();:@&=+$,/?%#[]_"
    return outputStr;
}

+ (NSString *)urldecode:(NSString *)input {
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr
            stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font {
    CGSize expectedLabelSize = CGSizeZero;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return CGSizeMake(expectedLabelSize.width, expectedLabelSize.height);
}

@end

@implementation NSMutableString (SafeAppend)
- (void)appendString:(NSString *)aString {
    [self appendStringSafe:aString];
}
- (void)appendStringSafe:(NSString *)aString {
    [self appendFormat:@"%@", aString];
}


@end
