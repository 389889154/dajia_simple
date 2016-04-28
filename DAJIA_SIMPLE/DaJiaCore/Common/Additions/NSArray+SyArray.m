//
//  NSArray+SyArray.m
//  DaJiaCore
//
//  Created by lihz on 10/26/14.
//  Copyright (c) 2014 zhengxiaofeng. All rights reserved.
//

#import "NSArray+SyArray.h"

@implementation NSArray (SyArray)
-(BOOL)containsString:(NSString *)string
{
    __block BOOL bRet = NO;
    [self enumerateObjectsUsingBlock:^(NSString *obj,NSUInteger idx,BOOL *bStop){
        bRet = [obj isEqualToString:string];
        *bStop = bRet;
    }];
    return bRet;
}
@end
