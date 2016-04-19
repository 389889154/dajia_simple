//
//  UIControl+Monitor.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UIControl+Monitor.h"
#import <objc/runtime.h>

static const char *kMonitorPage = "monitorPage";
static const char *kMonitorTag = "monitorTag";
@implementation UIControl (Monitor)
-(void)setMonitorPage:(NSString *)monitorPage
{
    objc_setAssociatedObject(self, &kMonitorPage, monitorPage, OBJC_ASSOCIATION_COPY);
}

-(NSString *)MonitorPage
{
    return (NSString *)objc_getAssociatedObject(self, &kMonitorPage);
}

-(void)setMonitorTag:(NSString *)monitorTag
{
    objc_setAssociatedObject(self, &kMonitorTag, monitorTag, OBJC_ASSOCIATION_COPY);
}

-(NSString *)MonitorTag
{
    return (NSString *)objc_getAssociatedObject(self, &kMonitorTag);
}
@end
