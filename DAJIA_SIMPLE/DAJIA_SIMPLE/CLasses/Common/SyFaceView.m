//
//  SyFaceView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyFaceView.h"
#import "UIView+SyView.h"
#import <QuartzCore/QuartzCore.h>
@implementation SyFaceView

- (void)setup {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 2.0;
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
}

- (void)customLayoutSubviews {
    [super customLayoutSubviews];
    _imageView.frame = CGRectMake(0, 0, self.width, self.height);
}
@end
