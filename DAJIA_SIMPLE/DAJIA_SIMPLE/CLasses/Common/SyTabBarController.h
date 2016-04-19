//
//  SyTabBarController.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SyTabBarController : UITabBarController

@end

@protocol SyTabBarControllerDelegate<NSObject>

- (void)tabBarDidSelectViewController;
- (void)tabBarShouldSelectViewController;

@end