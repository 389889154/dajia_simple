//
//  SyBaseNavView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseNavView.h"
#import "SyButton.h"


@implementation SyBaseNavView

- (CGRect)navigationBarFrame {
    return CGRectMake(0, 0, self.width, [self navigationBarHeight]);
}

+ (CGFloat)navigationBarHeight {
    return 64;
}

- (CGFloat)navigationBarHeight {
    return [SyBaseNavView navigationBarHeight];
}

+ (CGFloat)navigationBarBaseLine {
    return 20;
}

- (CGFloat)navigationBarBaseLine {
    return [SyBaseNavView navigationBarBaseLine];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (!_navigationBar) {
            _navigationBar = [[SyNavigationBar alloc] init];
            _navigationBar.backgroundColor = [UIColor clearColor];
            [self installNavigationBarButtons];
            [self addSubview:_navigationBar];
        }
    }
    return self;
}

- (void)installNavigationBarButtons {
    //内容详情 上部分导航条
    if (!_leftButton) {
        _leftButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _leftButton.backgroundColor = [UIColor clearColor];
        _leftButton.titleLabel.font = SyIconFont(20);
        [_leftButton setTitleColor:[UIColor whiteColor]
                          forState:UIControlStateNormal];
        _leftButton.contentHorizontalAlignment =
        UIControlContentHorizontalAlignmentLeft;
        _leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15.0, 0, 0);
        [_navigationBar addSubview:_leftButton];
    }
    
    if (!_rightButton) {
        _rightButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _rightButton.titleLabel.font = SyIconFont(20);
        [_rightButton setTitleColor:[UIColor whiteColor]
                           forState:UIControlStateNormal];
        _rightButton.contentHorizontalAlignment =
        UIControlContentHorizontalAlignmentRight;
        _rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 15.0);
        [_navigationBar addSubview:_rightButton];
    }
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kNavigationBarTitleColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = kNavigationBarTitleFont;
        _titleLabel.backgroundColor = [UIColor clearColor];
        [_navigationBar addSubview:_titleLabel];
    }
}

- (void)customLayoutSubviews {
    [super customLayoutSubviews];
    _navigationBar.frame = [self navigationBarFrame];
    
    _leftButton.frame =
    CGRectMake(0, [self navigationBarBaseLine] +
               ([self navigationBarHeight] -
                [self navigationBarBaseLine] - kHeight_LeftButton) /
               2.0,
               80, kHeight_LeftButton);
    _rightButton.frame =
    CGRectMake(_navigationBar.width - 80,
               [self navigationBarBaseLine] +
               ([self navigationBarHeight] -
                [self navigationBarBaseLine] - kHeight_LeftButton) /
               2.0,
               80, kHeight_LeftButton);
    _titleLabel.frame = CGRectMake(
                                   kLeftMargin_LeftButton + kWidth_LeftButton, [self navigationBarBaseLine],
                                   self.width - (kLeftMargin_LeftButton + kWidth_LeftButton) * 2,
                                   [self navigationBarHeight] - [self navigationBarBaseLine]);
}



@end
