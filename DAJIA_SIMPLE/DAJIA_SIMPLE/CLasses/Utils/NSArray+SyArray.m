//
//  NSArray+SyArray.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
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
