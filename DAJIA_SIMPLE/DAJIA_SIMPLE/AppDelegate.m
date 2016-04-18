//
//  AppDelegate.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/3/31.
//  Copyright © 2016年 weiSH. All rights reserved.
//
#import "RootViewController.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "SyFileManager.h"
#import "GuidePageVIew.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%@",NSHomeDirectory());
    RootViewController *rootVC = [[RootViewController alloc]init];
    self.window.rootViewController = rootVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 检查网络
    [self checkNetworkStatus];
    //检查版本
    [self checkVersion];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)checkNetworkStatus {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkChangeAction:) name:kReachabilityChangedNotification object:nil];
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [reachability startNotifier];
}

- (void)networkChangeAction:(NSNotification *)note {
    Reachability *curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    
    switch (netStatus) {
        case NotReachable: {
            NSLog(@"NotReachable");
            break;
        }
        case ReachableViaWWAN: {
            NSLog(@"ReachableViaWWAN");
            break;
        }
        case ReachableViaWiFi: {
            NSLog(@"ReachableViaWiFi");
            break;
        }
    }
    
}

- (void)checkVersion {
    
    NSString *cacheAppVersion = [SyCacheManager sharedSyCacheManager].appVersion;
    NSString *currentVersion = SY_APP_SHORTVERSION;
    NSComparisonResult comparisonResult =
    [cacheAppVersion compare:currentVersion options:NSNumericSearch];
    
    [SyCacheManager sharedSyCacheManager].setupGuide = NO;
    [SyCacheManager sharedSyCacheManager].upgradeGuide = NO;
    if (!cacheAppVersion) {
        //新装App
        //所有新安装App时都回显示引导页
        NSLog(@"第一次安装");
        [self setUpGuidePage];
        [SyCacheManager sharedSyCacheManager].downloadApp = YES;
        [SyCacheManager sharedSyCacheManager].setupGuide = YES;
        [SyCacheManager sharedSyCacheManager].appVersion = SY_APP_SHORTVERSION;
        [self MainProgress];
        return;
    } else if (cacheAppVersion &&
               ![cacheAppVersion isEqualToString:currentVersion]) {
        [SyCacheManager sharedSyCacheManager].downloadApp = NO;
        //如果当前小版本有升级引导页则置为YES
        NSLog(@"升级APP");
        [SyCacheManager sharedSyCacheManager].upgradeGuide = NO;
    }
    switch (comparisonResult) {
        case NSOrderedAscending: {
            NSLog(@"升级版本 %@-->%@",cacheAppVersion,currentVersion);
            //            if ([[SyGlobleManager sharedSyGlobleManager] isNeedUpdateData]) {
            //                SyUpgradeViewController *upgradeViewController =
            //                [SyUpgradeViewController VersionValidUpgradeController:^() {
            //                    log4Fatal(@"dajiaios:upgrade app completed!");
            //                    [SyCacheManager sharedSyCacheManager].appVersion =
            //                    SY_APP_SHORTVERSION;
            //                    [self MainProgress];
            //
            //                }];
            //                self.window.rootViewController = upgradeViewController;
            //            }
            break;
        }
        case NSOrderedSame:
            NSLog(@" 当前版本 %@",currentVersion);
            //            if (!currentVersion) {
            //                log4Fatal(@"Unusual version:%@", currentVersion);
            //                SyUpgradeViewController *upgradeViewController =
            //                [SyUpgradeViewController
            //                 VersionUnvalidUpgradeController:SyInstalledEarlierVersion
            //                 failedHandler:^() {
            //                     abort();
            //                 }];
            //                self.window.rootViewController = upgradeViewController;
            //            } else {
            //                [self MainProgress];
            //            }
            break;
        case NSOrderedDescending:
            NSLog(@"降级 %@ --> %@", cacheAppVersion, currentVersion);
            //            SyUpgradeViewController *upgradeViewController = [SyUpgradeViewController
            //                                                              VersionUnvalidUpgradeController:SyInstalledEarlierVersion
            //                                                              failedHandler:^() {
            //                                                                  abort();
            //                                                              }];
            //            self.window.rootViewController = upgradeViewController;
            break;
    }
    
}

- (void)MainProgress {
    
    UIApplication *application = [UIApplication sharedApplication];
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        if([[[UIDevice currentDevice] systemVersion]  floatValue] >=8.0 ){
            UIUserNotificationType userNotificationTypes =
            (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |
             UIUserNotificationTypeSound);
            UIUserNotificationSettings *settings =
            [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                              categories:nil];
            [application registerUserNotificationSettings:settings];
            [application registerForRemoteNotifications];
        }
        
    } else {
        [application
         registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert |
                                             UIRemoteNotificationTypeSound)];
    }
    
    //  创建结构目录
    [SyFileManager shareInstance];
    //  请求配置链接
    [self requestServerBaseURL];
    
}

- (void)requestServerBaseURL {

}

#pragma mark ---- 设置引导页
- (void)setUpGuidePage {
    
    NSArray *imageArr = nil;
    NSString *sizeStr = nil;
    if (SY_320x480) {
        sizeStr = @"640x960";
    }else if (SY_320x568){
        sizeStr = @"640x1136";
    }else if (SY_375x667){
        sizeStr = @"750x1334";
    }else if (SY_414x736){
        sizeStr = @"1242x2208";
    }else {
        sizeStr = @"1242x2208";
    }
    imageArr = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:[NSString stringWithFormat:@"GuideImages/setup-%@",sizeStr]];
    imageArr  = [imageArr sortedArrayUsingSelector:@selector(compare:)];
    GuidePageVIew *guideView = [[GuidePageVIew alloc]init];
    guideView.imageDatas = imageArr;
    __weak typeof(GuidePageVIew) *weakGuideView = guideView;
    guideView.buttonAction = ^{
    [UIView animateWithDuration:2.f animations:^{
        weakGuideView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [weakGuideView removeFromSuperview];
    }];
    };
    [self.window addSubview:guideView];
}

@end
