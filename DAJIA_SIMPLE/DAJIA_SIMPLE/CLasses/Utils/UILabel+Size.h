//
//  UILabel+Size.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Size)

- (CGSize)boundingSizeWithSize:(CGSize)size;
- (CGSize)boundingSizeWithWidth:(CGFloat)width;

@end
