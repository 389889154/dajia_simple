//
//  SyBaseRequest.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#define kManagerName @"managerName"
#define kMethodName @"managerMethod"
#define kArguments @"arguments"
// 请求方式
#define kRequestType_get 1  // get请求
#define kRequestType_post 2 // post请求
#define kRequestType_oauth_get 3
#define kRequestType_version_get 4
#define kRequestType_baseurl_get 5
#define kRequestType_openid_get 6

#import <Foundation/Foundation.h>

@interface SyBaseRequest : NSObject {
    NSString *_managerName;              //
    NSString *_methodName;               // 方法名
    NSUInteger _requestType;             // 请求类型
    NSMutableDictionary *_parametersDic; // 参数字典     json
    NSString *_url;                      //请求的地址
}

- (instancetype)initWithURL:(NSString *)url;
@property(nonatomic, copy) NSString *managerName;
@property(nonatomic, copy) NSString *methodName;
@property(nonatomic, assign) NSUInteger requestType;
@property(nonatomic, readonly) NSString *url;
@property(nonatomic, readonly) NSData *postData;

- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key;
- (void)setLongLongValue:(long long)value forKey:(NSString *)key;
- (void)setBOOLValue:(BOOL)value forKey:(NSString *)key;
// 请求的参数字典
- (NSDictionary *)parametersDic;
@end
