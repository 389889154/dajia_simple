//
//  SyServerManager.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyServerManager.h"

#define kExperience_FeedbackAddress @"/r/f/523999939497"
#define kOnLine_RegisterAddress @"/navigation/goToPersonRegisterByMobile.action"
#define kExperience_ApplyStartAddress @"/r/f/658302146919"
#define kOnLine_ForgetAddress @"/personregistermobile/goToForgetPassword.action"
#define kOnLine_ModifyPassword \
@"/personregistermobile/goToChangePassword.action"
#define kOnLine_DajiaProtocol @"/navigation/goToServiceAgreement.action"
#define KShareFeedURL @"/m/goToShowFeedDetail.action?sID="
#define KShareBlogURL @"/m/goToShowBlogDetail.action?sID="
#define KShareCompanyQRURL @"/m/goToShowCompanyQRDetail.action?cID="
#define kModifyPersonInformation_ServerAddress \
@"/navigation/goToModifyPersonBaseInfo.action"
#define kTipoffURL @"/navigation/goToTipoff.action"
#define kBindPhoneNumAddress @"/personregistermobile/goToWeixinBindPhone.action"
#define kMyAddress @"/receiveaddress/getReceiveAddressList.action"
#define kMyOrder @"/orderform/getMobileMyOrderListIndex.action"
#define kInformationCollectFormAddress \
@"/informationform/startServiceForm.action"
#define kQueryInformationCollectFormAddress \
@"/informationformrecord/queryOpenFormOneRecord.action"
#define kRichFeedDetailUrl \
@"/personfeed/pushDetail.action"
#define kOnLine_ServerAddress @"/mobile"
#define kOauthSuffix @"/oauth/token"
#define kOpenIDSuffix @"/openid/getOpenID.json"

// 主机头
#define kServerDomain @"http://m.dajiashequ.com/dajia_mobile"
 static SyServerManager *instance = nil;

@implementation SyServerManager
+ (SyServerManager *)defaultManager {
   
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SyServerManager alloc]init];
        [SyServerManager reSet];
    });
    instance.versionAddress = [SyCacheManager sharedSyCacheManager].versionHost;
    if ([SyCacheManager sharedSyCacheManager].experienced) {
        // 体验
        instance.serverDomain = kServerDomain;
        instance.tipoffAddress = [NSString
                                  stringWithFormat:@"%@%@",
                                  [SyCacheManager sharedSyCacheManager].webHostExp,
                                  kTipoffURL];
        instance.serverAddress = [NSString
                                  stringWithFormat:@"%@%@",
                                  [SyCacheManager sharedSyCacheManager].mobileHostExp,
                                  kOnLine_ServerAddress];
        instance.oauthAddress = [NSString
                                 stringWithFormat:@"%@%@",
                                 [SyCacheManager sharedSyCacheManager].tokenHostExp,
                                 kOauthSuffix];
        instance.openIDAddress = [NSString
                                  stringWithFormat:@"%@%@",
                                  [SyCacheManager sharedSyCacheManager].tokenHostExp,
                                  kOpenIDSuffix];
        instance.urlHeader = [SyCacheManager sharedSyCacheManager].webHostExp;
        instance.bindPhoneNumAddress = [NSString
                                        stringWithFormat:@"%@%@",
                                        [SyCacheManager sharedSyCacheManager].webHostExp,
                                        kBindPhoneNumAddress];
        instance.myAddress = [NSString
                              stringWithFormat:@"%@%@",
                              [SyCacheManager sharedSyCacheManager].webHostExp,
                              kMyAddress];
        instance.myOrder = [NSString
                            stringWithFormat:@"%@%@",
                            [SyCacheManager sharedSyCacheManager].webHostExp,
                            kMyOrder];
        instance.mysflAddress = [NSString
                                 stringWithFormat:@"%@/r/mysfl/running/1?access_token=%%@&companyID=%%@",
                                 [SyCacheManager sharedSyCacheManager].webHostExp];
        instance.informationCollectFormAddress = [NSString
                                                  stringWithFormat:@"%@%@",
                                                  [SyCacheManager sharedSyCacheManager].webHostExp,
                                                  kInformationCollectFormAddress];
        
        instance.queryInformationCollectFormAddress = [NSString
                                                       stringWithFormat:@"%@%@",
                                                       [SyCacheManager sharedSyCacheManager].webHostExp,
                                                       kQueryInformationCollectFormAddress];
        instance.orderAddressOther = [NSString
                                      stringWithFormat:@"%@%@",
                                      [SyCacheManager sharedSyCacheManager].webHostExp,
                                      kOrderAddressOther];
        instance.orderAddressMe = [NSString
                                   stringWithFormat:@"%@%@",
                                   [SyCacheManager sharedSyCacheManager].webHostExp,
                                   kOrderAddressMe];
        instance.richFeedDetailUrl = [NSString stringWithFormat:@"%@%@",
                                      [SyCacheManager sharedSyCacheManager].webHostExp,kRichFeedDetailUrl];
    } else {
        // 正式
        instance.serverDomain = kServerDomain;
        instance.serverAddress = [NSString
                                  stringWithFormat:@"%@%@",
                                  /*@"http://192.168.80.109:8087/dajia_mobile"*/
                                  [SyCacheManager sharedSyCacheManager].mobileHost,
                                  kOnLine_ServerAddress];
        instance.tipoffAddress = [NSString
                                  stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                                  kTipoffURL];
        instance.oauthAddress = [NSString
                                 stringWithFormat:@"%@%@",
                                 [SyCacheManager sharedSyCacheManager].tokenHost,
                                 kOauthSuffix];
        instance.openIDAddress = [NSString
                                  stringWithFormat:@"%@%@",
                                  [SyCacheManager sharedSyCacheManager].tokenHost,
                                  kOpenIDSuffix];
        instance.urlHeader = [SyCacheManager sharedSyCacheManager].webHost;
        instance.bindPhoneNumAddress = [NSString
                                        stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                                        kBindPhoneNumAddress];
        instance.myAddress = [NSString
                              stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                              kMyAddress];
        instance.myOrder = [NSString
                            stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                            kMyOrder];
        instance.mysflAddress = [NSString
                                 stringWithFormat:@"%@/r/mysfl/running/1?access_token=%%@&companyID=%%@",
                                 [SyCacheManager sharedSyCacheManager].webHost];
        
        instance.informationCollectFormAddress = [NSString
                                                  stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                                                  kInformationCollectFormAddress];
        instance.queryInformationCollectFormAddress = [NSString
                                                       stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                                                       kQueryInformationCollectFormAddress];
        instance.orderAddressOther = [NSString
                                      stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                                      kOrderAddressOther];
        instance.orderAddressMe = [NSString
                                   stringWithFormat:@"%@%@", [SyCacheManager sharedSyCacheManager].webHost,
                                   kOrderAddressMe];
        instance.richFeedDetailUrl = [NSString stringWithFormat:@"%@%@",
                                      [SyCacheManager sharedSyCacheManager].webHost,kRichFeedDetailUrl];
    }
    
    instance.shareShortChain = [SyCacheManager sharedSyCacheManager].webShort;
    
    NSString *webHost = [SyCacheManager sharedSyCacheManager].webHost;
    instance.feedbackAddress =
    [NSString stringWithFormat:@"%@%@", webHost, kExperience_FeedbackAddress];
    instance.registerAddress =
    [NSString stringWithFormat:@"%@%@", webHost, kOnLine_RegisterAddress];
    instance.forgetAddress =
    [NSString stringWithFormat:@"%@%@", webHost, kOnLine_ForgetAddress];
    instance.modifyPassword =
    [NSString stringWithFormat:@"%@%@", webHost, kOnLine_ModifyPassword];
    instance.dajiaProtocol =
    [NSString stringWithFormat:@"%@%@", webHost, kOnLine_DajiaProtocol];
    instance.shareFeedURL =
    [NSString stringWithFormat:@"%@%@", webHost, KShareFeedURL];
    instance.shareBlogURL =
    [NSString stringWithFormat:@"%@%@", webHost, KShareBlogURL];
    instance.shareCompanyQRURL =
    [NSString stringWithFormat:@"%@%@", webHost, KShareCompanyQRURL];
    instance.modifyPersonalURl =
    [NSString stringWithFormat:@"%@%@", webHost,
     kModifyPersonInformation_ServerAddress];
    instance.applyStartAddress = [NSString
                                  stringWithFormat:@"%@%@", webHost, kExperience_ApplyStartAddress];
    return instance;
}

+ (BOOL)reSet {
    instance.serverAddress = nil;
    return YES;
}

@end
