//
//  NSString+Size.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Size)

- (CGSize)boundingSizeWithFont:(UIFont *)font;
- (CGSize)boundingSizeWithFont:(UIFont *)font width:(CGFloat)width;
- (CGSize)boundingSizeWithFont:(UIFont *)font size:(CGSize)size;
- (CGSize)boundingSizeWithFont:(UIFont *)font size:(CGSize)size option:(NSStringDrawingOptions)options;

@end
