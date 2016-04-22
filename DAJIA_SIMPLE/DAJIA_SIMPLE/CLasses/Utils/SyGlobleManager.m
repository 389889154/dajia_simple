//
//  SyGlobleManager.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/20.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyGlobleManager.h"
#import "SyBaseViewController.h"
#import "SyRecordView.h"
#import "AppDelegate.h"

/**
 *  去评论设置
 */
#define kCommentAppKey @"commentAppKey"
#define kCommentAppStatusKey @"commentAppStatusKey"
#define kCommentAppOptCounterKey @"commentAppOptCounterKey"
#define kCommentAppResetVersionKey @"commentAppResetVersionKey"
const static NSInteger kCommentAppNoneStatus = 0;
const static NSInteger kCommentAppCancelStatus = 1;
const static NSInteger kCommentAppOKStatus = 2;
@interface SyGlobleManager ()<SyProviderDelegate> {
    SyPromptView *_promptView;  // 提示框
    SyRecordView *_recordView;
}
@property(nonatomic, weak) SyBaseProvider *destroyFeedProvider;
@property(nonatomic, strong) SyCustomStatusBar *customStatusBar;
@property(nonatomic, strong) SyCustomStatusBar *customRedStatusBar;

static SyGlobleManager *instance = nil;
@implementation SyGlobleManager

@end
