//
//  BaseModel.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Mantle/Mantle.h>
#pragma mark --- 基本数据类型的(nsintger == null),崩溃,必须setnil在.M 文件里面,并自动赋值为0
@interface BaseModel : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *myID;
+(NSDictionary *)JSONKeyPathsByPropertyKey :(NSMutableDictionary *)sourceDic ;
@end
