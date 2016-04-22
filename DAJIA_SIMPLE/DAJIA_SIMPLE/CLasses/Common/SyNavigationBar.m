//
//  SyNavigationBar.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyNavigationBar.h"



@implementation SyNavigationBar
- (void)setup {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.backgroundColor = [UIColor redColor];
        [self addSubview:_backgroundImageView];
    }
}

- (void)customLayoutSubviews {
    [super customLayoutSubviews];
    _backgroundImageView.frame = CGRectMake(0, 0, self.width, self.height);
}


@end
