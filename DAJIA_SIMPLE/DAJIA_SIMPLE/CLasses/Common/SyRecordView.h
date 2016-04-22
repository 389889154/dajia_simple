//
//  SyRecordView.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/20.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseView.h"

@interface SyRecordView : SyBaseView

@property(nonatomic, strong) UIImageView *bkImageView;
@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *deleteLabel;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *numberLabel;
@property(nonatomic, assign) BOOL animationFlag;

//录音提示，会自动消失
- (void)popMessageDefinedText:(NSString *)message;
//录音提示
- (void)popUserDefinedText:(NSString *)message;
//关闭提示
- (void)closeRecordMessage;

//读取设置录音时间长度
- (NSString *)numberLabelText;
- (void)setNumberLabelText:(NSString *)length;
//设置图片
- (void)setVolume:(CGFloat)volume;

@end
