//
//  ShCommonUI.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/3/31.
//  Copyright © 2016年 weiSH. All rights reserved.
//


#ifndef ShCommonUI_h
#define ShCommonUI_h

#define k_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define k_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SyViewPadding UIEdgeInsetsMake(15, 15, 15, 15)
#define SyViewMargin UIEdgeInsetsMake(10, 10, 10, 10)
#define SyViewFeedMargin UIEdgeInsetsMake(8, 8, 8, 8)

#define SyRichTextFont SyScaleFont(17)
#define SyFwdRichTextFont SyScaleFont(16)
#define SyCommentRichTextFont SyScaleFont(16)

//---------------------------默认键盘高度
#define SY_KEYBOARD_HEIGHT 216

//---------------------------AutoLayout宏
#define SyLayoutConstraint(view1, attr1, relation, view2, attr2, m, c) \
[NSLayoutConstraint constraintWithItem:(view1)                       \
attribute:(attr1)                       \
relatedBy:(relation)                    \
toItem:(view2)                       \
attribute:(attr2)                       \
multiplier:(m)                           \
constant:(c)]

#define SyArrayLayoutConstraint(formatStr, opts, metricDic, viewArr) \
[NSLayoutConstraint constraintsWithVisualFormat:(formatStr)        \
options:(opts)             \
metrics:(metricDic)        \
views:(viewArr)]


/** 颜色宏 */
#define RGBCOLOR(r, g, b)            \
[UIColor colorWithRed:(r) / 255.0f \
green:(g) / 255.0f \
blue:(b) / 255.0f \
alpha:1]
#define RGBACOLOR(r, g, b, a)        \
[UIColor colorWithRed:(r) / 255.0f \
green:(g) / 255.0f \
blue:(b) / 255.0f \
alpha:(a)]
#define RGBA(r, g, b, a) (r) / 255.0f, (g) / 255.0f, (b) / 255.0f, (a)
#define UIColorFromRGB(rgbValue)                                       \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:1.0]

/** 图片宏 */
#define SY_IMAGE(name) [UIImage imageNamed:(name)]

#define kLineHeight_CellLine 0.5
#define kLineColor UIColorFromRGB(0xe1e2e6)
#define kButtonBorderColor UIColorFromRGB(0xd9dade)
#define kLineLightColor RGBACOLOR(0, 0, 0, 0.05)
#define kNavigationBarColor UIColorFromRGB(0x00ace6)
#define kViewBackgroundColor UIColorFromRGB(0xedeef2)
#define kViewLightBgColor UIColorFromRGB(0xfafafa)
#define kNormalColor_CellBackground [UIColor whiteColor]
#define kSelectedColor_CellBackground UIColorFromRGB(0xefefef)
#define kHighlightedColor_CellBackground UIColorFromRGB(0xefefef)
#define kImagePlazBackgroundColor UIColorFromRGB(0xf9f9f9)
#define kFontLightGrayColor UIColorFromRGB(0x666666)
#define kFontDarkGrayColor UIColorFromRGB(0x999999)
#define kFontBlackColor UIColorFromRGB(0x333333)
#define kFontBlueColor UIColorFromRGB(0x1270b3)
#define kFontYellowColor UIColorFromRGB(0xff9317)
#define kFontGreenColor UIColorFromRGB(0x19d1aa)

#define kNavigationBarTitleFont \
SY_414x736 ? SyFont(20) : (SY_375x667 ? SyFont(19) : SyFont(18))
#define kNavigationBarTitleColor UIColorFromRGB(0xFFFFFF)
#define SyIconFont(s) ([UIFont fontWithName:@"iconfont" size:(s)])
#define kMargin_Width 15
#define kWidth_ArrowButton 25
#define SyFont(s) ([UIFont systemFontOfSize:(s)])
#pragma mark - Banner
#define kHeight_LeftListCell 57
#define kLeftNavigationBarMaxHeight 110
#define kLeftNavigationBarMinHeight 55
#define kHeight_NavigationBar 44
#define kTopMargin_NavigationBar 5
#define kLeftMargin_NavigationBar 5
#define kLeftMargin_LeftButton 0  //  扩大响应区域
#define kWidth_LeftButton 50
#define kHeight_LeftButton kHeight_NavigationBar


#endif /* ShCommonUI_h */
