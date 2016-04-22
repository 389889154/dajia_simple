//
//  SyBaseNavViewController.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseViewController.h"
#import "SyConstant.h"
typedef NS_ENUM(NSInteger,SyLeftButtonType) {
    SyLeftButtonNone,
    SyLeftButtonPop,
    SyLeftButtonDismiss,
    SyLeftButtonOther
};
@class MPresetMenuMini;
@class SyTabBarItem;
@interface SyBaseNavViewController : SyBaseViewController
{
@public
    NSString *businessModuleCode;
}
@property(nonatomic, assign) SyLeftButtonType leftButtonType;
@property(nonatomic, strong) MPresetMenuMini *presetMenu;
@property(nonatomic, strong) SyTabBarItem *baseTabBarItem;

/**
 *  跳转到指定的Controller
 *
 *  @param code
 *  @param context
 *
 *  @return
 */

- (BOOL)showViewControllerWidthCode:(const NSString *)code context:(NSDictionary *)context;

+ (SyBusinessModuleCode)businessModuleCode;
@end
