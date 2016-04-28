//
//  SyBaseProvider.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SyBaseRequest.h"
#import "SyBaseResponse.h"
@class SyBaseProvider;
typedef   NS_ENUM(NSInteger,SyURLRequestStatusType){
    SyURLRequestStartType,
    SyURLRequestFinishedType,
    SyURLRequestFailType,
    SyURLRequestProgress
};

typedef void(^URLRequestStatusHandler) (SyURLRequestStatusType status,SyBaseProvider *provider,NSError *error);
typedef void(^URLRequestProgressHandler)(float) ;
#pragma 代理
@protocol SyProviderDelegate <NSObject>
@optional
// 请求成功 通过getResponse 获取数据
- (void)providerDidFinishLoad:(SyBaseProvider *)provider;
// 请求失败
- (void)provider:(SyBaseProvider *)provider
didFailLoadWithError:(NSError *)error;

//请求开始发送
- (void)providerDidStartLoad:(SyBaseProvider *)provider;

//请求进度
- (void)provider:(SyBaseProvider *)provider progress:(float)progress;
@end




//服务器接口基类，不可直接使用
@interface SyBaseProvider : NSObject {
@protected
    id<SyProviderDelegate> _delegate;
    SyBaseRequest *_request;
    SyBaseResponse *_response;
}

//请求对象
@property(nonatomic, strong) SyBaseRequest *request;

//返回对象
@property(nonatomic, readonly) SyBaseResponse *response;

// 存储数据
@property(nonatomic, strong) NSMutableDictionary *storeDic;

/**
 *  设置该标识后底层将不再对错误进行默认的提示
 */
@property(nonatomic, assign) BOOL ignoreError;

/**
 *  反馈进度
 */
@property(nonatomic, readonly) float progress;

/**
 *  请求状态变化处理Block
 */
@property(nonatomic, copy) URLRequestStatusHandler statusHandler;

/**
 *  请求进度变化处理Block
 */
@property(nonatomic, copy) URLRequestProgressHandler progressHandler;

//初始化
- (id)initWithDelegate:(id<SyProviderDelegate>)aDelegate;

//发送请求
- (void)request:(SyBaseRequest *)request;

//取消请求
- (void)cancel;

//包装异常
- (NSError *)handleError:(NSObject *)error;

@end


#pragma mark --- block 类目

@interface SyBaseProvider (Block)<SyProviderDelegate>

/**
 *  请求无复杂逻辑的数据时可以使用这个方法
 *  该方法不需要使用delegate，而是使用block回调的方式处理结果
 *  使请求数据和处理数据的逻辑尽量的紧凑
 *
 *  @param request
 *  @param handler
 */
- (void)request:(SyBaseRequest *)request
        handler:(URLRequestStatusHandler)handler;

/**
 *  功能同request:handler:，支持进度响应Block
 *
 *  @param request
 *  @param handler
 *  @param progressHandler
 */
- (void)request:(SyBaseRequest *)request
        handler:(URLRequestStatusHandler)handler
progressHandler:(URLRequestProgressHandler)progressHandler;



@end

