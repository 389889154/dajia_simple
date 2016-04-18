//
//  SyBaseViewController.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/18.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,SyLoadWithType) {
    SyLoadWithPush,
    SyLoadWithPresent,
    SyLoadWithTabBar,
    SyLoadWithWindow,
    SyLoadWithRoot
};


@interface SyBaseViewController : UIViewController

@property (nonatomic, readonly) BOOL isVisible;

@property (nonatomic, assign) SyLoadWithType loadWithType;

/** YES 表示该Controller 是嵌入到其他View中的 */
@property (nonatomic, readonly) BOOL embedded;

- (instancetype)initWithType:(SyLoadWithType)loadWithType;

/** 切换子视图 */
- (void)transitionViewController:(UIViewController *)controller;

- (void)showMomentAlertWithMessage:(NSString *)message;

/** 2s 消失弹出框 : msg,img ,view*/
- (void)showMomentAlertWithMessage:(NSString *)message
                         imageName:(NSString *)imageName
                            inView:(UIView *)view;

- (void)showLoadingView;

- (void)showLoadingView:(NSString *)message;

- (void)hideLoadingView;

- (void)onStatusBarTouch;

/** 首页需改为YES, 其他页面默认为NO */
- (BOOL)isPortalVC;

/** 更换皮肤 */
- (void)changeSkin;

-(CGRect)mainFrame;



@end
