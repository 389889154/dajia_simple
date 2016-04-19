//
//  UIColor+Category.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UIColor+Category.h"

#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@implementation UIColor (Category)


+ (UIColor *)colorWithString:(NSString *)string {
    return [self colorWithString:string defaultColor:[UIColor whiteColor]];
}

+ (UIColor *)colorWithString:(NSString *)string defaultColor:(UIColor *)color {
    if (string && string.length > 0) {
        NSString *cs = [string lowercaseString];
        if ([cs rangeOfString:@"rgb"].location != NSNotFound) {
            NSError *error;
            NSString *regulaStr = @"[\\d|.]+";
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                                   options:NSRegularExpressionCaseInsensitive
                                                                                     error:&error];
            NSArray *arrayOfAllMatches = [regex matchesInString:cs options:0 range:NSMakeRange(0, [cs length])];
            //    for (NSTextCheckingResult *match in arrayOfAllMatches) {
            //      NSString *substringForMatch = [cs substringWithRange:match.range];
            //      NSLog(@"substringForMatch");
            //    }
            if (arrayOfAllMatches.count>0) {
                if (arrayOfAllMatches.count>3) {
                    NSTextCheckingResult *m0 = [arrayOfAllMatches objectAtIndex:0];
                    CGFloat r = [[cs substringWithRange:m0.range] floatValue];
                    NSTextCheckingResult *m1 = [arrayOfAllMatches objectAtIndex:1];
                    CGFloat g = [[cs substringWithRange:m1.range] floatValue];
                    NSTextCheckingResult *m2 = [arrayOfAllMatches objectAtIndex:2];
                    CGFloat b = [[cs substringWithRange:m2.range] floatValue];
                    NSTextCheckingResult *m3 = [arrayOfAllMatches objectAtIndex:3];
                    CGFloat a = [[cs substringWithRange:m3.range] floatValue];
                    return RGBACOLOR(r, g, b, a);
                } else {
                    NSTextCheckingResult *m0 = [arrayOfAllMatches objectAtIndex:0];
                    CGFloat r = [[cs substringWithRange:m0.range] floatValue];
                    NSTextCheckingResult *m1 = [arrayOfAllMatches objectAtIndex:1];
                    CGFloat g = [[cs substringWithRange:m1.range] floatValue];
                    NSTextCheckingResult *m2 = [arrayOfAllMatches objectAtIndex:2];
                    CGFloat b = [[cs substringWithRange:m2.range] floatValue];
                    return RGBCOLOR(r, g, b);
                }
            } else {
                return [UIColor blackColor];
            }
        } else {
            return [self colorWithHexString:string];
        }
    } else {
        return color;
    }
}

// 16进制颜色(html颜色值)字符串转为UIColor
+ (UIColor *)colorWithHexString:(NSString *)hexString {
    NSString *cString = [[hexString
                          stringByTrimmingCharactersInSet:
                          [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    } else if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    unsigned int r, g, b, a;
    
    a = 1.0f;
    
    if (cString.length == 6) {
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
    } else if (cString.length == 8) {
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *aString = [cString substringWithRange:range];
        range.location = 2;
        NSString *rString = [cString substringWithRange:range];
        range.location = 4;
        NSString *gString = [cString substringWithRange:range];
        range.location = 6;
        NSString *bString = [cString substringWithRange:range];
        
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
    } else {
        return DEFAULT_VOID_COLOR;
    }
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:a];
}


@end
