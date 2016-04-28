//
//  SyBaseResponse.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//




#import <Foundation/Foundation.h>

@interface SyBaseResponse : NSObject

@property (nonatomic, strong) NSData *responseData;

/**
 *  根据failType返回对应的描述文字
 *
 *  @param failType
 *
 *  @return
 */
+ (NSString *)errorMessage:(NSInteger)failType;
@end
