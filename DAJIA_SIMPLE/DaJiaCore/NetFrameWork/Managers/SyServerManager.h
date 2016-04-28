//
//  SyServerManager.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kOrderAddressOther @"/orderform/startOrderFormProcess.action"
#define kOrderAddressMe @"/orderform/startOrderFormProcessForMe.action"

@interface SyServerManager : NSObject {
    NSString *_serverAddress;
    NSString *_versionAddress;
}

@property(nonatomic, copy) NSString *serverDomain;
@property(nonatomic, copy) NSString *serverAddress;
@property(nonatomic, copy) NSString *oauthAddress;
@property(nonatomic, copy) NSString *openIDAddress;
@property(nonatomic, copy) NSString *versionAddress;
@property(nonatomic, copy) NSString *inviteAddress;
@property(nonatomic, copy) NSString *registerAddress;
@property(nonatomic, copy) NSString *applyStartAddress;
@property(nonatomic, copy) NSString *forgetAddress;
@property(nonatomic, copy) NSString *modifyPassword;
@property(nonatomic, copy) NSString *tipoffAddress;
@property(nonatomic, copy) NSString *dajiaProtocol;
@property(nonatomic, copy) NSString *feedbackAddress;
@property(nonatomic, copy) NSString *bindPhoneNumAddress;
@property(nonatomic, copy) NSString *myAddress;
@property(nonatomic, copy) NSString *mysflAddress;
@property(nonatomic, copy) NSString *myOrder;
@property(nonatomic, copy) NSString *informationCollectFormAddress;
@property(nonatomic, copy) NSString *queryInformationCollectFormAddress;
@property(nonatomic, copy) NSString *orderAddressOther;
@property(nonatomic, copy) NSString *orderAddressMe;
@property(nonatomic, copy) NSString *richFeedDetailUrl;


/*
 * 拼接url使用，当应用里面配置表单时，服务器只返回表单ID，其他的要端来拼接
 * 这时候就使用这个属性
 */
@property(nonatomic, copy) NSString *urlHeader;

//---------微信分享
@property(nonatomic, copy) NSString *shareFeedURL;
@property(nonatomic, copy) NSString *shareBlogURL;
@property(nonatomic, copy) NSString *shareCompanyQRURL;
@property(nonatomic, copy) NSString *modifyPersonalURl;
@property(nonatomic, copy) NSString *shareShortChain;

+ (SyServerManager *)defaultManager;
+ (BOOL)reSet;

/**
 *  当前网络状态
 */
@property(nonatomic, assign) NetworkStatus currentNetworkStatus;


@end
