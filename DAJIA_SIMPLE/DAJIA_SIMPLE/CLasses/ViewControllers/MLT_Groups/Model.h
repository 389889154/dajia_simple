//
//  Model.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "BaseModel.h"
@class UserModel;
@interface Model : BaseModel
@property (nonatomic, strong) UserModel *userInfo;
@property (nonatomic, strong) NSString *modelID;
@property (nonatomic, strong) NSString *refreshType;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSString *refreshURL;
@property (nonatomic, assign) NSInteger sourceVersion;
@property (nonatomic, strong) NSString *htmlURL;
@property (nonatomic, strong) NSString *sourceURL;
@property (nonatomic, strong) NSString *htmlID;
@property (nonatomic, strong) NSString *backgroundColor;
@property (nonatomic, strong) NSArray *backgroudImageDefinedList;

@end
