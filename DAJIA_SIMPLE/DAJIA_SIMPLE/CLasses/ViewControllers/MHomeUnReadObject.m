//
//  MHomeUnReadObject.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "MHomeUnReadObject.h"

@implementation MHomeUnReadObject

+(NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    
    if ([key isEqualToString:@"group"]) {
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MHomeUnReadParam class]];
    }else if ([key isEqualToString:@"topicPreset"]){
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:[MHomeUnReadParam class]];
    }
    return nil;
}

@end

@implementation MHomeUnReadParam

@end