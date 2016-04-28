//
//  Model.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "Model.h"
#import "UserModel.h"
@implementation Model

+ (NSDictionary *)JSONKeyPathsByPropertyKey:(NSMutableDictionary *)sourceDic {
    [sourceDic setValuesForKeysWithDictionary:@{
                                                    @"userInfo":@"person",
                                                    @"modelID":@"cID"
                                                }];
    
    return sourceDic;
}


+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    if ([key isEqualToString:@"userModel"]) {
        return [MTLJSONAdapter dictionaryTransformerWithModelClass:[UserModel class]];
    } else {
        return nil;
    }
}

#pragma mark --- 把父类参数打出,格式不正确
//+ (NSValueTransformer *)userInfoJSONTransformer {
//    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[UserModel class]];
//}




@end
