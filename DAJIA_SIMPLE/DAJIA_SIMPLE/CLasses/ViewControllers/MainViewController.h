//
//  MainViewController.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/11.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SyPortalLoadStatus) {
    SyPortalCacheValid,
    SyPortalLoadStartStatus,
    SyPortalLoadFinishedStatus,
    SyPortalLoadFailStatus,
    SyPortalLoadProgress,
};

typedef void (^CacheTemplateHandler)(SyPortalLoadStatus status,
                                     NSString *content, NSURL *baseURL, float progress);
@interface MainViewController : UIViewController
@property(nonatomic, copy) CacheTemplateHandler templateHandler;
@end
