//
//  SyBaseNavView.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseView.h"
#import "SyNavigationBar.h"
#import "SyButton.h"
@interface SyBaseNavView : SyBaseView {
    SyNavigationBar *_navigationBar;
}

@property(nonatomic, strong) SyNavigationBar *navigationBar;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) SyButton *leftButton;
@property(nonatomic, strong) SyButton *rightButton;

- (void)installNavigationBarButtons;
+ (CGFloat)navigationBarHeight;
- (CGFloat)navigationBarHeight;
+ (CGFloat)navigationBarBaseLine;
- (CGFloat)navigationBarBaseLine;
- (CGRect)navigationBarFrame;
@end
