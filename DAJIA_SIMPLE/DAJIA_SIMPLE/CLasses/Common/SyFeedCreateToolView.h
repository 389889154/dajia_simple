//
//  SyFeedCreateToolView.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/20.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseView.h"
@class SyButton,SyView;
typedef NS_ENUM(NSUInteger, SyFeedCreateToolViewType) {
    SyFeedCreateToolViewTypeFeedCreate,
    SyFeedCreateToolViewTypeFeedFwd,
    SyFeedCreateToolViewTypeFeedComment,
    SyFeedCreateToolViewTypeFeedNotice
};

@interface SyFeedCreateToolView : SyBaseView
@property(nonatomic, strong) SyView *topLineView;
@property(nonatomic, strong) SyView *bottomLineView;
@property(nonatomic, strong) SyButton *attachButton;
@property(nonatomic, strong) SyButton *faceButton;
@property(nonatomic, strong) SyButton *atButton;
@property(nonatomic, strong) SyButton *setButton;
@property(nonatomic, strong) SyView *dotImageView;
@property(nonatomic, strong) SyButton *topicButton;
@property(nonatomic, strong) SyButton *keyButton;
@property(nonatomic, strong) SyButton *locationButton;
@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, assign) NSInteger selectIndex;
@property(nonatomic, assign) SyFeedCreateToolViewType type;

+ (CGFloat)viewHeight;

@end
