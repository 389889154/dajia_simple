//
//  SyFeedCreateToolView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/20.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyFeedCreateToolView.h"
#import "SyButton.h"
#import "SyView.h"

#define SyBtnMainColor [UIColor redColor]
#define kLeftMargin_AttachButton 0
#define kWidth_SendButton 55
#define kHeight_SendButton 30
#define kRightMargin_SendButton 15
#define kWidth_iconImageView 10.5
#define kHeight_iconImageView 6

@interface SyFeedCreateToolView () {
}
@end

@implementation SyFeedCreateToolView

+ (CGFloat)viewHeight {
    
    return 40;
}

- (void)setType:(SyFeedCreateToolViewType)type {
    if (_type != type) {
        _type = type;
        [self customLayoutSubviews];
    }
}

- (void)setup {
    if (!_topLineView) {
        _topLineView = [[SyView alloc] init];
        _topLineView.backgroundColor = kLineColor;
        [self addSubview:_topLineView];
    }
    
    if (!_bottomLineView) {
        _bottomLineView = [[SyView alloc] init];
        _bottomLineView.backgroundColor = kLineColor;
        [self addSubview:_bottomLineView];
    }
    
    if (!_attachButton) {
        _attachButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _attachButton.titleLabel.font = SyIconFont(23);
        [_attachButton setTitle:@"附件" forState:UIControlStateNormal];
        [_attachButton setTitleColor:kFontDarkGrayColor
                            forState:UIControlStateNormal];
        [_attachButton setTitleColor:[UIColor redColor]
                            forState:UIControlStateHighlighted];
        [_attachButton setTitleColor:SyBtnMainColor
                            forState:UIControlStateSelected];
        [self addSubview:_attachButton];
    }
    
    if (!_dotImageView) {
        _dotImageView = [[SyView alloc] init];
        _dotImageView.backgroundColor = [UIColor redColor];
        _dotImageView.layer.masksToBounds = YES;
        _dotImageView.layer.cornerRadius = 3;
        _dotImageView.layer.shadowColor = [UIColor redColor].CGColor;
        _dotImageView.layer.shadowOffset = CGSizeMake(1, 1);
        _dotImageView.layer.shadowOpacity = 0.5;
        _dotImageView.hidden = YES;
        [_attachButton addSubview:_dotImageView];
    }
    
    if (!_faceButton) {
        _faceButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _faceButton.titleLabel.font = SyIconFont(23);
        [_faceButton setTitle:@"开心客服"
                     forState:UIControlStateNormal];
        [_faceButton setTitleColor:kFontDarkGrayColor
                          forState:UIControlStateNormal];
        [_faceButton setTitleColor:SyBtnMainColor
                          forState:UIControlStateHighlighted];
        [_faceButton setTitleColor:SyBtnMainColor forState:UIControlStateSelected];
        [self addSubview:_faceButton];
    }
    
    if (!_atButton) {
        _atButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _atButton.titleLabel.font = SyIconFont(23);
        [_atButton setTitle:@"@" forState:UIControlStateNormal];
        [_atButton setTitleColor:kFontDarkGrayColor forState:UIControlStateNormal];
        [_atButton setTitleColor:SyBtnMainColor forState:UIControlStateHighlighted];
        [_atButton setTitleColor:SyBtnMainColor forState:UIControlStateSelected];
        [self addSubview:_atButton];
    }
    
    if (!_locationButton) {
        _locationButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _locationButton.titleLabel.font = SyIconFont(23);
        [_locationButton setTitle:@"位置签到"
                         forState:UIControlStateNormal];
        [_locationButton setTitleColor:kFontDarkGrayColor
                              forState:UIControlStateNormal];
        [_locationButton setTitleColor:SyBtnMainColor
                              forState:UIControlStateHighlighted];
        [_locationButton setTitleColor:SyBtnMainColor
                              forState:UIControlStateSelected];
        [self addSubview:_locationButton];
    }
    
    if (!_topicButton) {
        _topicButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _topicButton.titleLabel.font = SyIconFont(23);
        [_topicButton setTitle:@"话题说话"
                      forState:UIControlStateNormal];
        [_topicButton setTitleColor:kFontDarkGrayColor
                           forState:UIControlStateNormal];
        [_topicButton setTitleColor:SyBtnMainColor
                           forState:UIControlStateHighlighted];
        [_topicButton setTitleColor:SyBtnMainColor forState:UIControlStateSelected];
        [self addSubview:_topicButton];
    }
    
    if (!_setButton) {
        _setButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _setButton.titleLabel.font = SyIconFont(23);
        [_setButton setTitle:@"设置齿轮" forState:UIControlStateNormal];
        [_setButton setTitleColor:kFontDarkGrayColor forState:UIControlStateNormal];
        [_setButton setTitleColor:SyBtnMainColor
                         forState:UIControlStateHighlighted];
        [_setButton setTitleColor:SyBtnMainColor forState:UIControlStateSelected];
        [self addSubview:_setButton];
    }
    
    if (!_keyButton) {
        _keyButton = [SyButton buttonWithType:UIButtonTypeCustom];
        _keyButton.titleLabel.font = SyIconFont(23);
        [_keyButton setTitle:@"收起键盘" forState:UIControlStateNormal];
        [_keyButton setTitleColor:kFontDarkGrayColor forState:UIControlStateNormal];
        [_keyButton setTitleColor:SyBtnMainColor
                         forState:UIControlStateHighlighted];
        [_keyButton setTitleColor:SyBtnMainColor forState:UIControlStateSelected];
        _keyButton.hidden = YES;
        [self addSubview:_keyButton];
    }
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = SY_IMAGE(@"createAttachTop");
        [self addSubview:_iconImageView];
    }
    
    _selectIndex = -1;
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (_selectIndex != selectIndex) {
        _selectIndex = selectIndex;
        [self customLayoutSubviews];
    }
}

- (void)customLayoutSubviews {
    CGFloat chooseBarButtonWidth = SY_SCREEN_WIDTH / 5.0f;
    
    _topLineView.frame = CGRectMake(0, 0, self.width, kLineHeight_CellLine);
    _bottomLineView.frame = CGRectMake(0, self.height - kLineHeight_CellLine,
                                       self.width, kLineHeight_CellLine);
    
    CGFloat x = kLeftMargin_AttachButton;
    if (_type == SyFeedCreateToolViewTypeFeedCreate ||
        _type == SyFeedCreateToolViewTypeFeedComment ||
        _type == SyFeedCreateToolViewTypeFeedNotice) {
        _attachButton.frame = CGRectMake(x, 0, chooseBarButtonWidth,
                                         [SyFeedCreateToolView viewHeight]);
        _dotImageView.frame = CGRectMake(_attachButton.width - 21, 6, 6, 6);
        
        x += chooseBarButtonWidth;
    } else {
        _attachButton.frame = CGRectMake(x, 0, 0, 0);
        _dotImageView.frame = CGRectMake(_attachButton.width - 21, 6, 0, 0);
    }
    
    if (_type == SyFeedCreateToolViewTypeFeedCreate ||
        _type == SyFeedCreateToolViewTypeFeedComment ||
        _type == SyFeedCreateToolViewTypeFeedFwd) {
        _faceButton.frame = CGRectMake(x, 0, chooseBarButtonWidth,
                                       [SyFeedCreateToolView viewHeight]);
        
        x += chooseBarButtonWidth;
    } else {
        _faceButton.frame = CGRectMake(_attachButton.originX, 0, 0, 0);
    }
    
    if (_type == SyFeedCreateToolViewTypeFeedCreate ||
        _type == SyFeedCreateToolViewTypeFeedComment ||
        _type == SyFeedCreateToolViewTypeFeedFwd) {
        _atButton.frame = CGRectMake(x, 0, chooseBarButtonWidth,
                                     [SyFeedCreateToolView viewHeight]);
        
        x += chooseBarButtonWidth;
    } else {
        _atButton.frame = CGRectMake(_faceButton.originX, 0, 0, 0);
    }
    
    if (_type == SyFeedCreateToolViewTypeFeedCreate ||
        _type == SyFeedCreateToolViewTypeFeedComment ||
        _type == SyFeedCreateToolViewTypeFeedFwd ||
        _type == SyFeedCreateToolViewTypeFeedNotice) {
        _locationButton.frame = CGRectMake(x, 0, chooseBarButtonWidth,
                                           [SyFeedCreateToolView viewHeight]);
        
        x += chooseBarButtonWidth;
    } else {
        _locationButton.frame = CGRectMake(_faceButton.originX, 0, 0, 0);
    }
    
    if (_type == SyFeedCreateToolViewTypeFeedCreate ||
        _type == SyFeedCreateToolViewTypeFeedFwd) {
        _topicButton.frame = CGRectMake(x, 0, chooseBarButtonWidth,
                                        [SyFeedCreateToolView viewHeight]);
        
        x += chooseBarButtonWidth;
    } else {
        _topicButton.frame = CGRectMake(_atButton.originX, 0, 0, 0);
    }
    
    if (_type == SyFeedCreateToolViewTypeFeedComment) {
        _setButton.frame = CGRectMake(x, 0, chooseBarButtonWidth,
                                      [SyFeedCreateToolView viewHeight]);
        
        x += chooseBarButtonWidth;
    } else {
        _setButton.frame = CGRectMake(_topicButton.originX, 0, 0, 0);
    }
    
    if (_selectIndex == 0) {
        _attachButton.selected = YES;
        _faceButton.selected = NO;
        _atButton.selected = NO;
        _locationButton.selected = NO;
        _topicButton.selected = NO;
        _setButton.selected = NO;
        _iconImageView.frame =
        CGRectMake(_attachButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, kWidth_iconImageView,
                   kHeight_iconImageView);
    } else if (_selectIndex == 1) {
        _attachButton.selected = NO;
        _faceButton.selected = YES;
        _atButton.selected = NO;
        _locationButton.selected = NO;
        _topicButton.selected = NO;
        _setButton.selected = NO;
        _iconImageView.frame =
        CGRectMake(_faceButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, kWidth_iconImageView,
                   kHeight_iconImageView);
    } else if (_selectIndex == 2) {
        _attachButton.selected = NO;
        _faceButton.selected = NO;
        _atButton.selected = YES;
        _locationButton.selected = NO;
        _topicButton.selected = NO;
        _setButton.selected = NO;
        _iconImageView.frame =
        CGRectMake(_atButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, kWidth_iconImageView,
                   kHeight_iconImageView);
    } else if (_selectIndex == 3) {
        _attachButton.selected = NO;
        _faceButton.selected = NO;
        _atButton.selected = NO;
        _locationButton.selected = YES;
        _topicButton.selected = NO;
        _setButton.selected = NO;
        _iconImageView.frame =
        CGRectMake(_topicButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, kWidth_iconImageView,
                   kHeight_iconImageView);
    } else if (_selectIndex == 4) {
        _attachButton.selected = NO;
        _faceButton.selected = NO;
        _atButton.selected = NO;
        _locationButton.selected = NO;
        _topicButton.selected = YES;
        _setButton.selected = NO;
        _iconImageView.frame =
        CGRectMake(_setButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, kWidth_iconImageView,
                   kHeight_iconImageView);
    } else if (_selectIndex == 5) {
        _attachButton.selected = NO;
        _faceButton.selected = NO;
        _atButton.selected = NO;
        _locationButton.selected = NO;
        _topicButton.selected = NO;
        _setButton.selected = YES;
        _iconImageView.frame =
        CGRectMake(_setButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, kWidth_iconImageView,
                   kHeight_iconImageView);
    } else {
        _attachButton.selected = NO;
        _faceButton.selected = NO;
        _atButton.selected = NO;
        _locationButton.selected = NO;
        _topicButton.selected = NO;
        _setButton.selected = NO;
        _iconImageView.frame =
        CGRectMake(_setButton.center.x - kWidth_iconImageView / 2,
                   self.height - kHeight_iconImageView, 0, 0);
    }
    
    _keyButton.frame =
    CGRectMake(self.width - chooseBarButtonWidth, 0, chooseBarButtonWidth,
               [SyFeedCreateToolView viewHeight]);
}



@end
