//
//  MHomeUnReadObject.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "BaseModel.h"

@interface MHomeUnReadObject : BaseModel
@property(nonatomic, copy) NSString *communityID;
@property(nonatomic, strong) NSArray *group;
@property(nonatomic, strong) NSArray *topicPreset;
@end
@interface MHomeUnReadParam : BaseModel
@property(nonatomic, copy) NSString *tagID;
@property(nonatomic, copy) NSString *tagName;
@property(nonatomic, copy) NSString *time;
@property(nonatomic, assign) NSInteger count;
@end