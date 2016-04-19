//
//  SyBaseTabBarController.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyTabBarController.h"
@class SyBaseTabBar,SyTabBarItem;

@interface SyBaseTabBarController : SyTabBarController
@property (nonatomic, strong) SyBaseTabBar *baseTabBar;
@end

@protocol SyBaseTabBarDelegate <NSObject>
@optional
- (void)tabBar:(SyBaseTabBar *)tabBar didSelectItem:(SyTabBarItem *)item;

- (void)tabBar:(SyBaseTabBar *)tabBar willBeginCustomizingItems:(NSArray<SyTabBarItem *> *)items;
- (void)tabBar:(SyBaseTabBar *)tabBar didBeginCustomizingItems:(NSArray<SyTabBarItem *> *)items;
- (void)tabBar:(SyBaseTabBar *)tabBar willEndCustomizingItems:(NSArray<SyTabBarItem *> *)items changed:(BOOL)change;
- (void)tabBar:(SyBaseTabBar *)tabBar didEndCustomizingItems:(NSArray<SyTabBarItem *> *)items changed:(BOOL)changed;
@end

@interface SyBaseTabBar : UIView
@property(nonatomic, assign) id<SyBaseTabBarDelegate> delegate;
@property(nonatomic, copy) NSArray<SyTabBarItem *> *items;
@property(nonatomic, assign) CGFloat colorOpacity;
@property(nonatomic, assign) SyTabBarItem *selectedItem;
@property(nonatomic, strong) UIView *colorView;
@property(nonatomic, strong) UIView *barView;
@property(nonatomic, strong) UIView *lineView;
@end

@interface SyTabBarButton : UIButton
@property (nonatomic, strong) UILabel *badgeView;
@property (nonatomic, strong) SyTabBarItem *item;
@end

@interface SyTabBarItem : UITabBarItem
@property(nonatomic, copy) UIColor *selectedBgColor;         //底部块的背景色（激活）
@property(nonatomic, copy) UIColor *selectedIconColor;       //底部块的字体色（激活）
@property(nonatomic, copy) UIColor *normalBgColor;   //底部块的背景色（非激活）
@property(nonatomic, copy) UIColor *normalIconColor; //底部块的字体色（非激活）
@property(nonatomic, copy) UIImage *iconImage;       //底部块的背景图
@property(nonatomic, copy) NSString *code;
@end
