//
//  SyButton.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SyButton : UIButton

@end

@interface  SyBadgeButton: SyButton

+ (instancetype)leftBadgeButton;
+ (instancetype)rightBadgeButton;

- (instancetype)init;
@property(nonatomic, assign) NSInteger badgeValue;
@property(nonatomic, assign) BOOL badgeShow;
@end