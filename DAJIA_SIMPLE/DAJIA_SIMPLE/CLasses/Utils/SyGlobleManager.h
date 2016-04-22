//
//  SyGlobleManager.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/20.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SyBaseViewController,SyRecordView;
@interface SyGlobleManager : NSObject
@property (nonatomic, strong) SyRecordView *recordView;


+ (SyGlobleManager *)sharedSyGlobleManager;

// 提示信息
- (void)pushPromptMessage:(NSString *)message;
//提示信息，可选择勾或者叉
- (void)pushPromptMessage:(NSString *)message andYes:(NSInteger)isYes;
//叹号提示
- (void)pushPromptMessageExclamation:(NSString *)message;

//浅蓝色风格
- (void)pushBlueStatusBarMessage:(NSString *)msg;
//浅黄色风格
- (void)pushYellowStatusBaMessage:(NSString *)msg;
//浅绿色风格
- (void)pushGreenStatusBaMessage:(NSString *)msg;
//浅红色风格
- (void)pushRedStatusBaMessage:(NSString *)msg;
- (void)popRedStatusBaMessage;
/**
 *  提示服务器更新中，红色，持续30秒
 *
 *  @param msg
 */
- (void)pushServerUpgradingMessage:(NSString *)msg;
/**
 *  AppStore版本专用，其他版本调用不执行任何操作
 *  去评论，调用一次就记录一次操作，操作第五次就会提示去评论
 *  不管用户选择忽略还是去评论，都不再提示，除非在特定版本更新后调用cleanCommentAppStatus
 */
- (void)gotoCommentApp;

/**
 *  AppStore版本专用，其他版本调用不执行任何操作
 *  清除以前版本继承下来的评论状态
 *  只有特定版本中又需求时才调用
 */
- (void)cleanCommentAppStatus;

/**
 * 判断是否需要更新数据
 */
- (BOOL)isNeedUpdateData;


@end
