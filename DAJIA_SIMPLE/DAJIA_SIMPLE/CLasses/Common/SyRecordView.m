//
//  SyRecordView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/20.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyRecordView.h"
#import "SyBaseNavView.h"
#import "SyFeedCreateToolView.h"
#define KBkImageViewWeightHeight 150

#define KMessageIconImageViewX 45
#define KMessageIconImageViewY 35
#define KMessageIconImageViewWeightHeight 60

#define kTopMargin_IconImageView 15
#define KHeight_ImageWeight 120
#define KHeight_ImageHeight 70

#import "SyRecordView.h"
//#import "SyGlobleManager.h"
//#import "SyAppDelegate.h"
#import "AppDelegate.h"
//#import "SyFeedCreateToolView.h"
#import "SyBaseNavView.h"

@implementation SyRecordView

- (void)setup {
    if (!_bkImageView) {
        _bkImageView = [[UIImageView alloc] init];
        _bkImageView.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
        [self addSubview:_bkImageView];
    }
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = SY_IMAGE(@"record_00");
        [_bkImageView addSubview:_iconImageView];
    }
    
    if (!_deleteLabel) {
        _deleteLabel = [[UILabel alloc] init];
//        _deleteLabel.font = SyScaleIconFont(60);
        _deleteLabel.textColor = [UIColor whiteColor];
        _deleteLabel.textAlignment = NSTextAlignmentCenter;
        _deleteLabel.text = @"清空删除";
        _deleteLabel.hidden = YES;
        [_bkImageView addSubview:_deleteLabel];
    }
    
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
//        _numberLabel.font = SyFont(14);
        _numberLabel.text = @"0\"";
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.backgroundColor = [UIColor clearColor];
        [_bkImageView addSubview:_numberLabel];
    }
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.font = SyFont(17);
        _titleLabel.text = @"SlideUp_To_Cancel";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.backgroundColor = [UIColor clearColor];
        [_bkImageView addSubview:_titleLabel];
    }
    
    _animationFlag = NO;
}

- (void)setVolume:(CGFloat)volume {
    [([UIApplication sharedApplication].delegate)
     .window bringSubviewToFront:self];
    if (volume <= 0.18) {
        _iconImageView.image = SY_IMAGE(@"record_03");
    } else if (volume <= 0.26) {
        _iconImageView.image = SY_IMAGE(@"record_02");
    } else if (volume <= 0.33) {
        _iconImageView.image = SY_IMAGE(@"record_01");
    } else {
        _iconImageView.image = SY_IMAGE(@"record_00");
    }
}

- (NSString *)numberLabelText {
    return _numberLabel.text;
}

- (void)setNumberLabelText:(NSString *)length {
    [_numberLabel setText:[NSString stringWithFormat:@"%@", length]];
}

- (void)popMessageDefinedText:(NSString *)message {
    [([UIApplication sharedApplication].delegate)
     .window bringSubviewToFront:self];
    if (_animationFlag == NO) {
        _animationFlag = YES;
        self.hidden = NO;
        self.alpha = 0.0;
        
        _numberLabel.hidden = YES;
        _iconImageView.image = SY_IMAGE(@"messageClose");
        _iconImageView.frame = CGRectMake(
                                          KMessageIconImageViewX, KMessageIconImageViewY,
                                          KMessageIconImageViewWeightHeight, KMessageIconImageViewWeightHeight);
        _titleLabel.text = message;
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.alpha = 1.0;
                         }
                         completion:^(BOOL finished) {
                             [self closeRecordMessage];
                         }];
    }
}



- (void)popUserDefinedText:(NSString *)message {
    [( [UIApplication sharedApplication].delegate)
     .window bringSubviewToFront:self];
    if (_animationFlag == NO) {
        _animationFlag = YES;
        self.hidden = NO;
        self.alpha = 0.0;
        _numberLabel.hidden = NO;
        _iconImageView.image = SY_IMAGE(@"record_00");
        _iconImageView.frame =
        CGRectMake(kTopMargin_IconImageView,
                   kTopMargin_IconImageView + kTopMargin_IconImageView - 10,
                   KHeight_ImageWeight, KHeight_ImageHeight);
        _bkImageView.alpha = 0.0;
        _titleLabel.text = message;
        [UIView animateWithDuration:0.5
                         animations:^{
                             self.alpha = 1.0;
                             _bkImageView.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                         }];
    }
}

- (void)closeRecordMessage {
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.2];
}

- (void)dismiss {
    [UIView animateWithDuration:0.2
                     animations:^{
                         self.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         self.hidden = YES;
                         _animationFlag = NO;
                         self.iconImageView.hidden = NO;
                         self.deleteLabel.hidden = YES;
                         self.titleLabel.textColor = [UIColor whiteColor];
                     }];
}

- (void)customLayoutSubviews {
    [super customLayoutSubviews];
    _bkImageView.frame =
    CGRectMake((SY_SCREEN_WIDTH - KBkImageViewWeightHeight) / 2,
               [SyBaseNavView navigationBarHeight] +
               (SY_SCREEN_HEIGHT - SY_KEYBOARD_HEIGHT -
                [SyFeedCreateToolView viewHeight] -
                [SyBaseNavView navigationBarHeight] -
                KBkImageViewWeightHeight) /
               2.0f,
               KBkImageViewWeightHeight, KBkImageViewWeightHeight);
    _bkImageView.layer.masksToBounds = YES;
    _bkImageView.layer.cornerRadius = 5;
    
    _deleteLabel.frame = CGRectMake(kTopMargin_IconImageView * 3, 28, 60, 60);
    
    _numberLabel.frame = CGRectMake(2, 85, 146, 30);
    
    _titleLabel.frame = CGRectMake(2, 108, 150, 30);
}

@end
