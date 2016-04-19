//
//  UIControl+Monitor.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 用户行为记录 */
@interface UIControl (Monitor)
-(void)setMonitorPage:(NSString *)monitorPage;
-(NSString *)MonitorPage;
-(void)setMonitorTag:(NSString *)monitorTag;
-(NSString *)MonitorTag;
@end
