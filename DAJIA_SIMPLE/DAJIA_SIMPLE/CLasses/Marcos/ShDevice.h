//
//  ShDevice.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/1.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#ifndef ShDevice_h
#define ShDevice_h

//---------------------------数字宏
#pragma mark Number宏
#define FloatNumber(n) [NSNumber numberWithFloat:n]
#define DoubleNumber(n) [NSNumber numberWithDouble:n]
#define BoolNumber(n) [NSNumber numberWithBool:n]
#define IntegerNumber(n) [NSNumber numberWithInteger:n]

#define SY_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SY_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//---------------------------设备宏
// iphone4、iphone4s、ipad模式下
#define SY_320x480                                                             \
((double)[[UIScreen mainScreen] bounds].size.height < (double)568)

// iphone5、iphone5s、iphone5c、iphone6放大模式下
#define SY_320x568                                                             \
(([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)

// iphone6标准模式下、iphone6 plus放大模式下
#define SY_375x667                                                             \
(667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

// iphone6 plus标准模式下
#define SY_414x736                                                             \
(736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

//---------------------------系统宏
#define SY_LEAST_IOS6                                                          \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 ? YES : NO)
#define SY_LEAST_IOS7                                                          \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define SY_LEAST_IOS8                                                          \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define SY_LEAST_IOS9 \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? YES : NO)

//---------------------------设备信息宏
#define SY_APP_NAME                                                            \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define SY_APP_VERSION                                                         \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define SY_APP_SHORTVERSION                                                    \
[[[NSBundle mainBundle] infoDictionary]                                      \
objectForKey:@"CFBundleShortVersionString"]
#define SY_APP_BUNDLEVERSION                                                   \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define SY_DEVICE_UNIQUEIDENTIFIER [[UIDevice currentDevice] uniqueIdentifier]
#define SY_DEVICE_NAME [[UIDevice currentDevice] name]
#define SY_DEVICE_SYSTEMNAME [[UIDevice currentDevice] systemName]
#define SY_DEVICE_SYSTEMVERSION [[UIDevice currentDevice] systemVersion]
#define SY_DEVICE_MODEL [[UIDevice currentDevice] model]
#define SY_DEVICE_LOCALIZEMODEL [[UIDevice currentDevice] localizedModel]


#endif /* ShDevice_h */
