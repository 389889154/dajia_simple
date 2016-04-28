//
//  SyLoginRequest.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyLoginRequest.h"

@implementation SyLoginRequest


- (id)initWithUsername:(NSString *)username password:(NSString *)password
{
    self = [super init];
    if (self) {
        self.requestType = kRequestType_oauth_get;
        self.managerName = @"oauth";
        self.methodName = @"token";
        self.username = username;
        self.password = password;
        
        [self setValue:@"password" forKey:@"grant_type"];
        [self setValue:username forKey:@"username"];
        [self setValue:password forKey:@"password"];
        
        
    }
    return self;
}



@end

@implementation SyOpenIDRequest
- (instancetype)initWithPID:(NSString *)pID
                   clientID:(NSString *)clientID
                accessToken:(NSString *)accessToken{
    self = [super init];
    if (self) {
        self.requestType = kRequestType_openid_get;
        self.managerName = @"openid";
        self.methodName = @"getOpenID.json";
        
        [self setValue:clientID forKey:@"clientID"];
        [self setValue:pID forKey:@"personID"];
        [self setValue:accessToken forKey:@"access_token"];
    }
    return self;
}
@end

@implementation SyOpenIDResponse
@end