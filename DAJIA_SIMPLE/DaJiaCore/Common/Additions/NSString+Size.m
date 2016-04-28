//
//  NSString+Size.m
//  SizeDemo
//
//  Created by zhaogw on 15/10/12.
//  Copyright © 2015年 Dajia. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)boundingSizeWithFont:(UIFont *)font {
  return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

- (CGSize)boundingSizeWithFont:(UIFont *)font width:(CGFloat)width {
  return [self boundingSizeWithFont:font size:CGSizeMake(width, 0)];
}

- (CGSize)boundingSizeWithFont:(UIFont *)font size:(CGSize)size {
  NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
  NSStringDrawingUsesLineFragmentOrigin |
  NSStringDrawingUsesFontLeading;
  return [self boundingSizeWithFont:font size:size option:options];
}

- (CGSize)boundingSizeWithFont:(UIFont *)font size:(CGSize)size option:(NSStringDrawingOptions)options {
  NSDictionary *attribute = @{NSFontAttributeName:font};
  CGSize retSize = CGSizeZero;
  if (self.length>0) {
    retSize = [self boundingRectWithSize:size
                                 options:options
                              attributes:attribute
                                 context:nil].size;
  }
  return retSize;
}

@end
