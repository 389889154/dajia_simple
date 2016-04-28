//
//  NSString+Size.h
//  SizeDemo
//
//  Created by zhaogw on 15/10/12.
//  Copyright © 2015年 Dajia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)
- (CGSize)boundingSizeWithFont:(UIFont *)font;
- (CGSize)boundingSizeWithFont:(UIFont *)font width:(CGFloat)width;
- (CGSize)boundingSizeWithFont:(UIFont *)font size:(CGSize)size;
- (CGSize)boundingSizeWithFont:(UIFont *)font size:(CGSize)size option:(NSStringDrawingOptions)options;
@end
