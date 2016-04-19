//
//  UILabel+Size.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UILabel+Size.h"
#import "NSString+Size.h"
@implementation UILabel (Size)

- (CGSize)boundingSizeWithSize:(CGSize)size {
    return [self.text boundingSizeWithFont:self.font size:size];
}

- (CGSize)boundingSizeWithWidth:(CGFloat)width {
    return [self.text boundingSizeWithFont:self.font size:CGSizeMake(width, 0)];
}

@end
