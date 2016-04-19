//
//  UIColor+Category.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithString:(NSString *)string;
+ (UIColor *)colorWithString:(NSString *)string defaultColor:(UIColor *)color;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
