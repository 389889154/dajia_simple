//
//  SyBaseViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/18.
//  Copyright © 2016年 weiSH. All rights reserved.
//
#define kControllerSuffix @"Controller"

#import "SyBaseViewController.h"
#import "MBProgressHUD.h"
#import "SyFaceView.h"

//#import "SyAppDelegate.h"
//#import "SyMainController.h"
//#import "SyExperiencePopView.h"
//#import "SyDajiaUtil.h"
//#import "SyScrollView.h"
//#import "SyTableView.h"
//#import "SyBaseNavView.h"
//#import "SyWebView.h"
//#import "SyBaseView.h"
//#import "SyCustomizationManager.h"
@interface SyBaseViewController ()<MBProgressHUDDelegate>{
    
    NSInteger _showLoadingViewCounter; // 记载窗体计算
    MBProgressHUD *_progressHUD;
    MBProgressHUD *_loadingView;
    BOOL _isVisible;
    BOOL _embedded;
}
@property (nonatomic, strong) UIViewController *currentViewController;
@end

@implementation SyBaseViewController

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//- (instancetype)init {
//    if (self = [super init]) {
//        self.loadWithType = SyLoadWithPush;
//    }
//}
@end
