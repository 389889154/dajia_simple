//
//  SyLoginRequest.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//


#import "SyBaseRequest.h"
#import "SyBaseResponse.h"
@interface SyLoginRequest : SyBaseRequest

- (id)initWithUsername:(NSString *)username password:(NSString *)password;

@property (nonatomic, copy) NSString    *username;
@property (nonatomic, copy) NSString    *password;


@end


@interface SyOpenIDRequest : SyBaseRequest
- (instancetype)initWithPID:(NSString *)pID
                   clientID:(NSString *)clientID
                accessToken:(NSString *)accessToken;
@end


@interface SyOpenIDResponse : SyBaseResponse
@property (nonatomic,copy)NSString *openID;
@property (nonatomic,copy)NSString *dajia_timestamp;
@property (nonatomic,copy)NSString *dajia_rand;
@property (nonatomic,copy)NSString *dajia_signature;
@end
