//
//  SyButton.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyButton.h"

@implementation SyButton

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self adjustLabelProperties];
}

- (void)adjustLabelProperties {  // override underline attribute
    NSMutableAttributedString *attributedText =
    [self.titleLabel.attributedText mutableCopy];
    
    [attributedText addAttribute:NSUnderlineStyleAttributeName
                           value:@(0)
                           range:NSMakeRange(0, [attributedText length])];
    self.titleLabel.attributedText = attributedText;
}

@end

#pragma mark --- SyBadgeButton

NS_ENUM(NSInteger, SyBadgePosition){
    SyBadgePositionLeft, SyBadgePositionRight,
};
@interface SyBadgeButton ()
@property(nonatomic, strong) UILabel *badge;
@property(nonatomic, strong) UILabel *label;
@property(nonatomic, strong) UILabel *masksLabel;
@property(nonatomic, assign) enum SyBadgePosition badgePosition;
@end

@implementation SyBadgeButton
+ (instancetype)leftBadgeButton {
    SyBadgeButton *button = [[SyBadgeButton alloc] init];
    button.badgePosition = SyBadgePositionLeft;
    return button;
}

+ (instancetype)rightBadgeButton {
    SyBadgeButton *button = [[SyBadgeButton alloc] init];
    button.badgePosition = SyBadgePositionRight;
    return button;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.layer.masksToBounds = NO;
        _masksLabel = [[UILabel alloc] init];
        _masksLabel.layer.masksToBounds = YES;
        [_masksLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_masksLabel];
        
        _label = [[UILabel alloc] init];
        _label.layer.masksToBounds = YES;
        [_label setBackgroundColor:[UIColor clearColor]];
        _label.layer.borderColor = [UIColor whiteColor].CGColor;
        _label.layer.borderWidth = 1;
        [_masksLabel addSubview:_label];
        
        _badge = [[UILabel alloc] init];
        _badge.hidden = YES;
        [_badge setTextAlignment:NSTextAlignmentCenter];
        [_badge setFont:SyFont(12)];
        [_badge setTextColor:[UIColor whiteColor]];
        [_badge setBackgroundColor:[UIColor redColor]];
        _badge.layer.masksToBounds = YES;
        [self addSubview:_badge];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        [_label setBackgroundColor:[UIColor whiteColor]];
    } else {
        [_label setBackgroundColor:[UIColor clearColor]];
    }
}

- (void)setBadgeValue:(NSInteger)badgeValue {
    _badgeValue = badgeValue;
    if (_badgeShow && _badgeValue != 0) {
        _badge.hidden = NO;
    } else {
        _badge.hidden = YES;
    }
    NSString *badgeString = @(_badgeValue).stringValue;
    if (_badgeValue > 99) {
        badgeString = @"99+";
    }
    //  log4Fatal(@"未读消息:%@,%@", badgeString,self.accessibilityValue);
    _badge.text = badgeString;
    //  [_badge setTitle:badgeString forState:UIControlStateNormal];
    [self layoutSubviews];
}
- (void)setBadgeShow:(BOOL)badgeShow {
    _badgeShow = badgeShow;
    if (_badgeShow && _badgeValue != 0) {
        _badge.hidden = NO;
    } else {
        _badge.hidden = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_badge sizeToFit];
    if ([_badge.text length] == 1) {  //一位数显示为圆形
        CGFloat wh = _badge.width > _badge.height ? _badge.width : _badge.height;
        wh += 4;  //文本上下留间隙
        _badge.frame = CGRectMake(0, 0, wh, wh);
    } else {  //其他时候显示成圆角矩形
        _badge.frame = CGRectMake(0, 0, _badge.width + 10, _badge.height);
    }
    //  if(_badge.width > _badge.height){
    //    _badge.frame.size.height = _badge.width;
    //  } else {
    //    _badge.frame.size.width = _badge.height;
    //  }
    CGRect rect = self.frame;
    CGRect badgeRect;
    switch (_badgePosition) {
        case SyBadgePositionLeft:
            badgeRect = CGRectMake(0, 0, _badge.width, _badge.height);
            rect.size.width += self.height / 2;
            _badge.frame = badgeRect;
            _badge.center = CGPointMake(self.frame.origin.x, self.frame.origin.y);
            break;
        case SyBadgePositionRight:
            badgeRect = CGRectMake(0, 0, _badge.width, _badge.height);
            rect.size.width += self.height / 2;
            rect.origin.x = -self.height / 2;
            _badge.frame = badgeRect;
            _badge.center =
            CGPointMake(self.bounds.origin.x + self.width, self.bounds.origin.y);
            break;
        default:
            break;
    }
    _label.frame = rect;
    _masksLabel.frame = self.bounds;
    _badge.layer.cornerRadius = _badge.height / 2;
    _label.layer.cornerRadius = self.height / 2;
}


@end
