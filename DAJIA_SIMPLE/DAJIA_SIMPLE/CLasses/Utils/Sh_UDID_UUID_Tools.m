//
//  Sh_UDID_UUID_Tools.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/1.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "Sh_UDID_UUID_Tools.h"
#import <Security/Security.h>
//#import "SSKeychainQuery.h"
#import <UIKit/UIKit.h>
@implementation Sh_UDID_UUID_Tools





+ (NSString *)UUID {
    CFUUIDRef puuid = CFUUIDCreate(nil);
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result =
    (NSString *)CFBridgingRelease(CFStringCreateCopy(NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}
@end
