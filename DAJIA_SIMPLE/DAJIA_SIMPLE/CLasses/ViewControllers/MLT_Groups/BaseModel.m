//
//  BaseModel.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    NSDictionary *dic = [NSDictionary mtl_identityPropertyMapWithModel:[self class]];
    return [self JSONKeyPathsByPropertyKey:[dic mutableCopy]];
}

+(NSDictionary *)JSONKeyPathsByPropertyKey :(NSMutableDictionary *)sourceDic {
    return sourceDic;
}
- (void)setNilValueForKey:(NSString *)key {
}

@end
