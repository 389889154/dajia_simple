//
//  SyCacheManager.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/15.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyCacheManager.h"
#define VarName(var) [NSString stringWithFormat:@"%s", #var]

typedef NS_ENUM(NSInteger,SyCacheLevel) {
    SyCacheLevelDefault,
    SyCacheLevelUser,
    SyCacheLevelCommunity,
    SyCacheLevelDate
};

@interface SyCacheManager ()
@property (nonatomic, copy) NSDictionary *userSetting;

@end

@implementation SyCacheManager

#define kCacheTopicPresetTemplateId @"TopicPresetTemplateId"

+ (SyCacheManager *)sharedSyCacheManager {
    static SyCacheManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
    });
    return instance;
}

- (BOOL)formalExisted {
    return [[self domainCacheValue:VarName(personID)
                             level:SyCacheLevelDefault
                            domain:@"formal"] boolValue];
}

#pragma mark ＝＝＝＝＝＝＝＝不需要清除＝＝＝＝＝＝＝＝
#pragma mark 服务器配置相关

- (void)setWebHost:(NSString *)webHost {
    [self setCacheValue:webHost key:VarName(webHost) level:SyCacheLevelDefault];
}
- (NSString *)webHost {
    return [self cacheValue:VarName(webHost) level:SyCacheLevelDefault];
}

- (void)setWebHostExp:(NSString *)webHostExp {
    [self setCacheValue:webHostExp
                    key:VarName(webHostExp)
                  level:SyCacheLevelDefault];
}
- (NSString *)webHostExp {
    return [self cacheValue:VarName(webHostExp) level:SyCacheLevelDefault];
}

- (void)setWebShort:(NSString *)webShort {
    [self setCacheValue:webShort key:VarName(webShort) level:SyCacheLevelDefault];
}
- (NSString *)webShort {
    return [self cacheValue:VarName(webShort) level:SyCacheLevelDefault];
}

- (void)setMobileHost:(NSString *)mobileHost {
    [self setCacheValue:mobileHost
                    key:VarName(mobileHost)
                  level:SyCacheLevelDefault];
}
- (NSString *)mobileHost {
    return [self cacheValue:VarName(mobileHost) level:SyCacheLevelDefault];
}

- (void)setMobileHostExp:(NSString *)mobileHostExp {
    [self setCacheValue:mobileHostExp
                    key:VarName(mobileHostExp)
                  level:SyCacheLevelDefault];
}
- (NSString *)mobileHostExp {
    return [self cacheValue:VarName(mobileHostExp) level:SyCacheLevelDefault];
}

- (void)setVersionHost:(NSString *)versionHost {
    [self setCacheValue:versionHost
                    key:VarName(versionHost)
                  level:SyCacheLevelDefault];
}
- (NSString *)versionHost {
    return [self cacheValue:VarName(versionHost) level:SyCacheLevelDefault];
}

- (void)setLogHost:(NSString *)logHost {
    [self setCacheValue:logHost key:VarName(logHost) level:SyCacheLevelDefault];
}
- (NSString *)logHost {
    return [self cacheValue:VarName(logHost) level:SyCacheLevelDefault];
}

- (void)setTokenHost:(NSString *)tokenHost {
    [self setCacheValue:tokenHost
                    key:VarName(tokenHost)
                  level:SyCacheLevelDefault];
}
- (NSString *)tokenHost {
    return [self cacheValue:VarName(tokenHost) level:SyCacheLevelDefault];
}

- (void)setTokenHostExp:(NSString *)tokenHostExp {
    [self setCacheValue:tokenHostExp
                    key:VarName(tokenHostExp)
                  level:SyCacheLevelDefault];
}
- (NSString *)tokenHostExp {
    return [self cacheValue:VarName(tokenHostExp) level:SyCacheLevelDefault];
}

- (void)setCommunityCategory:(NSString *)communityCategory {
    [self setCacheValue:communityCategory
                    key:VarName(communityCategory)
                  level:SyCacheLevelDefault];
}
- (NSString *)communityCategory {
    return [self cacheValue:VarName(communityCategory) level:SyCacheLevelDefault];
}

- (void)setUsername:(NSString *)username {
    [self setCacheValue:username key:VarName(username) level:SyCacheLevelDefault];
}
- (NSString *)username {
    return [self cacheValue:VarName(username) level:SyCacheLevelDefault];
}

- (void)setPassword:(NSString *)password {
    [self setCacheValue:password key:VarName(password) level:SyCacheLevelDefault];
}
- (NSString *)password {
    return [self cacheValue:VarName(password) level:SyCacheLevelDefault];
}

- (void)setDeviceToken:(NSString *)deviceToken {
    [self setCacheValue:deviceToken
                    key:VarName(deviceToken)
                  level:SyCacheLevelDefault];
}
- (NSString *)deviceToken {
    return [self cacheValue:VarName(deviceToken) level:SyCacheLevelDefault];
}

- (void)setAppVersion:(NSString *)appVersion {
    [self setCacheValue:appVersion
                    key:VarName(appVersion)
                  level:SyCacheLevelDefault];
}
- (NSString *)appVersion {
    return [self cacheValue:VarName(appVersion) level:SyCacheLevelDefault];
}

- (void)setHtmlID:(NSString *)htmlID {
    [self setCacheValue:htmlID key:VarName(htmlID) level:SyCacheLevelCommunity];
}
- (NSString *)htmlID {
    return [self cacheValue:VarName(htmlID) level:SyCacheLevelCommunity];
}

- (void)setSourceVersion:(NSInteger)sourceVersion {
    [self setCacheValue:[NSNumber numberWithInteger:sourceVersion] key:VarName(sourceVersion) level:SyCacheLevelUser];
}
- (NSInteger)sourceVersion {
    return [[self cacheValue:VarName(sourceVersion) level:SyCacheLevelUser] integerValue];
}

- (void)setLanguate:(NSString *)languate {
    [self setCacheValue:languate key:VarName(languate) level:SyCacheLevelDefault];
}
- (NSString *)languate {
    NSString *l = [self cacheValue:VarName(languate) level:SyCacheLevelDefault];
    if (l) {
        return l;
    } else {
        NSArray *languages =
        [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        NSString *current = [languages objectAtIndex:0];
        
        if ([current hasPrefix:@"en-"] || [current isEqualToString:@"en"]) {
            current = @"en";
        } else if ([current hasPrefix:@"zh-Hans-"] || [current isEqualToString:@"zh-Hans"]) {
            current = @"zh-Hans";
        } else {
            current = @"Base";
        }
        return current;
    }
}

- (void)setFontIndex:(float)fontIndex {
    [self setCacheValue:[NSNumber numberWithFloat:fontIndex]
                    key:VarName(fontIndex)
                  level:SyCacheLevelDefault];
}
- (float)fontIndex {
    NSString *s = [self cacheValue:VarName(fontIndex) level:SyCacheLevelDefault];
    if (s) {
        return [s floatValue];
    } else {
        if (SY_320x480 || SY_320x568) {
            return 1;
        } else if (SY_375x667) {
            return 2;
        } else {
            return 3;
        }
    }
}

- (void)setSlidingGuideStatus:(NSInteger)slidingGuideStatus {
    [self setCacheValue:[NSNumber numberWithInteger:slidingGuideStatus]
                    key:VarName(slidingGuideStatus)
                  level:SyCacheLevelDefault];
}
- (NSInteger)slidingGuideStatus {
    return [[self cacheValue:VarName(slidingGuideStatus)
                       level:SyCacheLevelDefault] integerValue];
}

- (void)setShowRongCloudAlert:(BOOL)showRongCloudAlert {
    [self setCacheValue:[NSNumber numberWithBool:showRongCloudAlert]
                    key:VarName(showRongCloudAlert)
                  level:SyCacheLevelDefault];
}
- (BOOL)showRongCloudAlert {
    return [[self cacheValue:VarName(showRongCloudAlert)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setLastLocation:(NSDictionary *)lastLocation {
    [self setCacheValue:lastLocation
                    key:VarName(lastLocation)
                  level:SyCacheLevelDefault];
}
- (NSDictionary *)lastLocation {
    return [self cacheValue:VarName(lastLocation) level:SyCacheLevelDefault];
}

- (void)setTouchStatusBarCount:(NSInteger)touchStatusBarCount {
    [self setCacheValue:[NSNumber numberWithInteger:touchStatusBarCount]
                    key:VarName(touchStatusBarCount)
                  level:SyCacheLevelDefault];
}
- (NSInteger)touchStatusBarCount {
    return [[self cacheValue:VarName(touchStatusBarCount)
                       level:SyCacheLevelDefault] integerValue];
}

- (void)setServiceFormGuideOpened:(NSInteger)serviceFormGuideOpened {
    [self setCacheValue:[NSNumber numberWithInteger:serviceFormGuideOpened]
                    key:VarName(serviceFormGuideOpened)
                  level:SyCacheLevelDefault];
}
- (NSInteger)serviceFormGuideOpened {
    return [[self cacheValue:VarName(serviceFormGuideOpened)
                       level:SyCacheLevelDefault] integerValue];
}

- (void)setExperienced:(BOOL)experienced {
    [self setCacheValue:[NSNumber numberWithBool:experienced]
                    key:VarName(experienced)
                  level:SyCacheLevelDefault];
}
- (BOOL)experienced {
    return [[self cacheValue:VarName(experienced)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setConnectGuideShowOpened:(BOOL)connectGuideShowOpened {
    [self setCacheValue:[NSNumber numberWithBool:connectGuideShowOpened]
                    key:VarName(connectGuideShowOpened)
                  level:SyCacheLevelDefault];
}
- (BOOL)connectGuideShowOpened {
    return [[self cacheValue:VarName(connectGuideShowOpened)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setAddMessageShowOpend:(BOOL)addMessageShowOpend {
    [self setCacheValue:[NSNumber numberWithBool:addMessageShowOpend]
                    key:VarName(addMessageShowOpend)
                  level:SyCacheLevelDefault];
}
- (BOOL)addMessageShowOpend {
    return [[self cacheValue:VarName(addMessageShowOpend)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setSetupGuide:(BOOL)setupGuide {
    [self setCacheValue:[NSNumber numberWithBool:setupGuide]
                    key:VarName(setupGuide)
                  level:SyCacheLevelDefault];
}
- (BOOL)setupGuide {
    return [[self cacheValue:VarName(setupGuide)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setUpgradeGuide:(BOOL)upgradeGuide {
    [self setCacheValue:[NSNumber numberWithBool:upgradeGuide]
                    key:VarName(upgradeGuide)
                  level:SyCacheLevelDefault];
}
- (BOOL)upgradeGuide {
    return [[self cacheValue:VarName(upgradeGuide)
                       level:SyCacheLevelDefault] boolValue];
}
- (void)setDownloadApp:(BOOL)downloadApp {
    [self setCacheValue:[NSNumber numberWithBool:downloadApp]
                    key:VarName(downloadApp)
                  level:SyCacheLevelDefault];
}
- (BOOL)downloadApp {
    return [[self cacheValue:VarName(downloadApp)
                       level:SyCacheLevelDefault] boolValue];
}
- (void)setIsFilledCol:(NSInteger)isFilledCol {
    [self setDomainCacheValue:[NSNumber numberWithInteger:isFilledCol]
                          key:VarName(isFilledCol)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)isFilledCol {
    return [[self domainCacheValue:VarName(isFilledCol)
                             level:SyCacheLevelCommunity] integerValue];
}
- (void)setIsColInfo:(NSInteger)isColInfo {
    [self setDomainCacheValue:[NSNumber numberWithInteger:isColInfo]
                          key:VarName(isColInfo)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)isColInfo {
    return [[self domainCacheValue:VarName(isColInfo)
                             level:SyCacheLevelCommunity] integerValue];
}
- (void)setContactSetType:(NSInteger)contactSetType {
    [self setDomainCacheValue:[NSNumber numberWithInteger:contactSetType]
                          key:VarName(contactSetType)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)contactSetType {
    return [[self domainCacheValue:VarName(contactSetType) level:SyCacheLevelCommunity] integerValue];
}
- (void)setJoinType:(NSInteger)joinType {
    [self setDomainCacheValue:[NSNumber numberWithInteger:joinType]
                          key:VarName(joinType)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)joinType {
    return [[self domainCacheValue:VarName(joinType)
                             level:SyCacheLevelCommunity] integerValue];
}

- (void)setIsPromptedCol:(NSInteger)isPromptedCol {
    [self setDomainCacheValue:[NSNumber numberWithInteger:isPromptedCol]
                          key:VarName(isPromptedCol)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)isPromptedCol {
    return [[self domainCacheValue:VarName(isPromptedCol)
                             level:SyCacheLevelCommunity] integerValue];
}
- (void)setSoundSwitch:(BOOL)soundSwitch {
    [self setCacheValue:[NSNumber numberWithBool:!soundSwitch]
                    key:VarName(soundSwitch)
                  level:SyCacheLevelDefault];
}
- (BOOL)soundSwitch {
    return ![[self cacheValue:VarName(soundSwitch)
                        level:SyCacheLevelDefault] boolValue];
}

- (void)setShakeSwitch:(BOOL)shakeSwitch {
    [self setCacheValue:[NSNumber numberWithBool:!shakeSwitch]
                    key:VarName(shakeSwitch)
                  level:SyCacheLevelDefault];
}
- (BOOL)shakeSwitch {
    return ![[self cacheValue:VarName(shakeSwitch)
                        level:SyCacheLevelDefault] boolValue];
}

- (void)setMainGuideOpened:(BOOL)mainGuideOpened {
    [self setCacheValue:[NSNumber numberWithBool:mainGuideOpened]
                    key:VarName(mainGuideOpened)
                  level:SyCacheLevelDefault];
}
- (BOOL)mainGuideOpened {
    return [[self cacheValue:VarName(mainGuideOpened)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setFeedGuideOpened:(BOOL)feedGuideOpened {
    [self setCacheValue:[NSNumber numberWithBool:feedGuideOpened]
                    key:VarName(feedGuideOpened)
                  level:SyCacheLevelDefault];
}
- (BOOL)feedGuideOpened {
    return [[self cacheValue:VarName(feedGuideOpened)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setShowRangeTip:(BOOL)showRangeTip {
    [self setCacheValue:[NSNumber numberWithBool:showRangeTip]
                    key:VarName(showRangeTip)
                  level:SyCacheLevelUser];
}
- (BOOL)showRangeTip {
    return [
            [self cacheValue:VarName(showRangeTip) level:SyCacheLevelUser] boolValue];
}

- (void)setSaveTrafficMode:(BOOL)saveTrafficMode {
    [self setCacheValue:[NSNumber numberWithBool:!saveTrafficMode]
                    key:VarName(saveTrafficMode)
                  level:SyCacheLevelUser];
}
- (BOOL)saveTrafficMode {
    return ![[self cacheValue:VarName(saveTrafficMode)
                        level:SyCacheLevelUser] boolValue];
}

- (void)setCahceMigrated:(BOOL)cahceMigrated {
    [self setCacheValue:[NSNumber numberWithBool:cahceMigrated]
                    key:VarName(cahceMigrated)
                  level:SyCacheLevelDefault];
}
- (BOOL)cahceMigrated {
    return [[self cacheValue:VarName(cahceMigrated)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setWeChatLogged:(BOOL)weChatLogged {
    [self setCacheValue:[NSNumber numberWithBool:weChatLogged]
                    key:VarName(weChatLogged)
                  level:SyCacheLevelDefault];
}
- (BOOL)weChatLogged {
    return [[self cacheValue:VarName(weChatLogged)
                       level:SyCacheLevelDefault] boolValue];
}

- (void)setExperienceDict:(NSDictionary *)experienceDict {
    return [self setCacheValue:experienceDict
                           key:VarName(experienceDict)
                         level:SyCacheLevelDefault];
}
- (NSDictionary *)experienceDict {
    return [self cacheValue:VarName(experienceDict) level:SyCacheLevelDefault];
}

#pragma mark ＝＝＝＝＝＝＝＝皮肤信息存储在单独的域下＝＝＝＝＝＝＝＝
- (void)setSkinDictionary:(NSMutableDictionary *)skinDictionary {
    NSString *cacheKey =
    [NSString stringWithFormat:@"%@_%@_%@", self.personID, self.communityID,
     VarName(skinDictionary)];
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:skinDictionary
                                                       forName:cacheKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableDictionary *)skinDictionary {
    NSString *cacheKey =
    [NSString stringWithFormat:@"%@_%@_%@", self.personID, self.communityID,
     VarName(skinDictionary)];
    NSMutableDictionary *dic = (NSMutableDictionary *)
    [[NSUserDefaults standardUserDefaults] persistentDomainForName:cacheKey];
    
    if (dic) {
        return dic;
    } else {
        return nil;
    }
}

#pragma mark ＝＝＝＝＝＝＝＝需要清除＝＝＝＝＝＝＝＝

- (void)setPersonID:(NSString *)personID {
    [self setDomainCacheValue:personID
                          key:VarName(personID)
                        level:SyCacheLevelDefault];
}
- (NSString *)personID {
    return [self domainCacheValue:VarName(personID) level:SyCacheLevelDefault];
}

- (void)setPersonName:(NSString *)personName {
    [self setDomainCacheValue:personName
                          key:VarName(personName)
                        level:SyCacheLevelDefault];
}
- (NSString *)personName {
    return [self domainCacheValue:VarName(personName) level:SyCacheLevelDefault];
}

- (void)setAccessToken:(NSString *)accessToken {
    [self setDomainCacheValue:accessToken
                          key:VarName(accessToken)
                        level:SyCacheLevelDefault];
}
- (NSString *)accessToken {
    return [self domainCacheValue:VarName(accessToken) level:SyCacheLevelDefault];
}

- (void)setImAccessToken:(NSString *)accessToken {
    [self setDomainCacheValue:accessToken
                          key:VarName(imAccessToken)
                        level:SyCacheLevelDefault];
}
- (NSString *)imAccessToken {
    return
    [self domainCacheValue:VarName(imAccessToken) level:SyCacheLevelDefault];
}

- (void)setRefreshToken:(NSString *)refreshToken {
    [self setDomainCacheValue:refreshToken
                          key:VarName(refreshToken)
                        level:SyCacheLevelDefault];
}

- (NSString *)refreshToken {
    return
    [self domainCacheValue:VarName(refreshToken) level:SyCacheLevelDefault];
}

- (void)setOpenIDInfo:(NSDictionary *)openIDInfo {
    [self setDomainCacheValue:openIDInfo
                          key:VarName(openIDInfo)
                        level:SyCacheLevelDefault];
}

- (NSDictionary *)openIDInfo {
    return [self domainCacheValue:VarName(openIDInfo) level:SyCacheLevelDefault];
}

- (void)setExpires_in:(long long)expires_in {
    [self setDomainCacheValue:[NSNumber numberWithLongLong:expires_in]
                          key:VarName(expires_in)
                        level:SyCacheLevelDefault];
}
- (long long)expires_in {
    return [[self domainCacheValue:VarName(expires_in)
                             level:SyCacheLevelDefault] longLongValue];
}

- (void)setCommunityID:(NSString *)communityID {
    [self setDomainCacheValue:communityID
                          key:VarName(communityID)
                        level:SyCacheLevelDefault];
}
- (NSString *)communityID {
    return [self domainCacheValue:VarName(communityID) level:SyCacheLevelDefault];
}

- (void)setColInfoFormID:(NSString *)colInfoFormID {
    [self setDomainCacheValue:colInfoFormID
                          key:VarName(colInfoFormID)
                        level:SyCacheLevelDefault];
}
- (NSString *)colInfoFormID {
    return
    [self domainCacheValue:VarName(colInfoFormID) level:SyCacheLevelDefault];
}

- (void)setCommunityName:(NSString *)communityName {
    [self setDomainCacheValue:communityName
                          key:VarName(communityName)
                        level:SyCacheLevelDefault];
}
- (NSString *)communityName {
    return
    [self domainCacheValue:VarName(communityName) level:SyCacheLevelDefault];
}

- (void)setCommunityLogo:(NSString *)communityLogo {
    [self setDomainCacheValue:communityLogo
                          key:VarName(communityLogo)
                        level:SyCacheLevelDefault];
}
- (NSString *)communityLogo {
    return
    [self domainCacheValue:VarName(communityLogo) level:SyCacheLevelDefault];
}

- (void)setCommunityShortChain:(NSString *)communityShortChain {
    [self setDomainCacheValue:communityShortChain
                          key:VarName(communityShortChain)
                        level:SyCacheLevelDefault];
}
- (NSString *)communityShortChain {
    return [self domainCacheValue:VarName(communityShortChain)
                            level:SyCacheLevelDefault];
}

- (void)setRoleName:(NSString *)roleName {
    [self setDomainCacheValue:roleName
                          key:VarName(roleName)
                        level:SyCacheLevelDefault];
}
- (NSString *)roleName {
    return [self domainCacheValue:VarName(roleName) level:SyCacheLevelDefault];
}

- (void)setUseTemplate:(BOOL)useTemplate {
    [self setDomainCacheValue:[NSNumber numberWithBool:useTemplate]
                          key:VarName(useTemplate)
                        level:SyCacheLevelUser];
}
- (BOOL)useTemplate {
    return [[self domainCacheValue:VarName(useTemplate)
                             level:SyCacheLevelUser] boolValue];
}

- (void)setNotificationOpened:(BOOL)notificationOpened {
    [self setDomainCacheValue:[NSNumber numberWithBool:notificationOpened]
                          key:VarName(notificationOpened)
                        level:SyCacheLevelCommunity];
}
- (BOOL)notificationOpened {
    return [[self domainCacheValue:VarName(notificationOpened)
                             level:SyCacheLevelCommunity] boolValue];
}

- (void)setPlazaEnabled:(BOOL)plazaEnabled {
    [self setDomainCacheValue:[NSNumber numberWithBool:plazaEnabled]
                          key:VarName(plazaEnabled)
                        level:SyCacheLevelCommunity];
}
- (BOOL)plazaEnabled {
    return [[self domainCacheValue:VarName(plazaEnabled)
                             level:SyCacheLevelCommunity] boolValue];
}

- (void)setTopicPersetObtained:(BOOL)topicPersetObtained {
    [self setDomainCacheValue:[NSNumber numberWithBool:topicPersetObtained]
                          key:VarName(topicPersetObtained)
                        level:SyCacheLevelCommunity];
}
- (BOOL)topicPersetObtained {
    return [[self domainCacheValue:VarName(topicPersetObtained)
                             level:SyCacheLevelCommunity] boolValue];
}

- (void)setFeedOrPlaza:(NSInteger)feedOrPlaza {
    [self setDomainCacheValue:[NSNumber numberWithInteger:feedOrPlaza]
                          key:VarName(feedOrPlaza)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)feedOrPlaza {
    return [[self domainCacheValue:VarName(feedOrPlaza)
                             level:SyCacheLevelCommunity] integerValue];
}

- (void)setMsgOrNotice:(NSInteger)msgOrNotice {
    [self setDomainCacheValue:[NSNumber numberWithInteger:msgOrNotice]
                          key:VarName(msgOrNotice)
                        level:SyCacheLevelCommunity];
}
- (NSInteger)msgOrNotice {
    return [[self domainCacheValue:VarName(msgOrNotice)
                             level:SyCacheLevelCommunity] integerValue];
}

- (void)setFaceCleanTime:(NSString *)faceCleanTime {
    [self setDomainCacheValue:faceCleanTime
                          key:VarName(faceCleanTime)
                        level:SyCacheLevelCommunity];
}
- (NSString *)faceCleanTime {
    return [self domainCacheValue:VarName(faceCleanTime)
                            level:SyCacheLevelCommunity];
}

- (void)setLastContactRequest:(NSString *)lastContactRequest {
    [self setDomainCacheValue:lastContactRequest
                          key:VarName(lastContactRequest)
                        level:SyCacheLevelCommunity];
}
- (NSString *)lastContactRequest {
    return [self domainCacheValue:VarName(lastContactRequest)
                            level:SyCacheLevelCommunity];
}

- (void)setLastCommunityConfigRequest:(NSString *)lastCommunityConfigRequest {
    [self setDomainCacheValue:lastCommunityConfigRequest
                          key:VarName(lastCommunityConfigRequest)
                        level:SyCacheLevelCommunity];
}
- (NSString *)lastCommunityConfigRequest {
    return [self domainCacheValue:VarName(lastCommunityConfigRequest)
                            level:SyCacheLevelCommunity];
}

- (void)setCommunityBottoms:(NSArray *)communityBottoms {
    [self setDomainCacheValue:[NSKeyedArchiver
                               archivedDataWithRootObject:communityBottoms]
                          key:VarName(communityBottoms)
                        level:SyCacheLevelCommunity];
}
- (NSArray *)communityBottoms {
    NSData *data = [self domainCacheValue:VarName(communityBottoms)
                                    level:SyCacheLevelCommunity];
    if (data) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    return nil;
}

- (void)setCommunityParam:(NSDictionary *)communityParam {
    [self setDomainCacheValue:communityParam
                          key:VarName(communityParam)
                        level:SyCacheLevelCommunity];
}
- (NSDictionary *)communityParam {
    return [self domainCacheValue:VarName(communityParam)
                            level:SyCacheLevelCommunity];
}

- (void)setRTypes:(NSArray *)rTypes {
    [self setDomainCacheValue:rTypes
                          key:VarName(rTypes)
                        level:SyCacheLevelCommunity];
}
- (NSArray *)rTypes {
    return [self domainCacheValue:VarName(rTypes) level:SyCacheLevelCommunity];
}

- (void)setCommunitySign:(NSDictionary *)communitySign {
    [self setDomainCacheValue:communitySign
                          key:VarName(communitySign)
                        level:SyCacheLevelCommunity];
}
- (NSDictionary *)communitySign {
    return [self domainCacheValue:VarName(communitySign)
                            level:SyCacheLevelCommunity];
}

- (void)setSignedInfo:(NSDictionary *)signedInfo {
    [self setDomainCacheValue:signedInfo
                          key:VarName(signedInfo)
                        level:SyCacheLevelDate];
}
- (NSDictionary *)signedInfo {
    return [self domainCacheValue:VarName(signedInfo) level:SyCacheLevelDate];
}
#pragma mark --- 未导入头文件
//
//- (void)setLastFeedRequest:(LastFeedRequest *)lastFeedRequest {
//    [self setDomainCacheValue:[NSKeyedArchiver
//                               archivedDataWithRootObject:lastFeedRequest]
//                          key:VarName(lastFeedRequest)
//                        level:SyCacheLevelCommunity];
//}
//- (LastFeedRequest *)lastFeedRequest {
//    NSData *lastFeedRequestData = [self domainCacheValue:VarName(lastFeedRequest)
//                                                   level:SyCacheLevelCommunity];
//    LastFeedRequest *last = nil;
//    if (lastFeedRequestData) {
//        @try {
//            last = [NSKeyedUnarchiver unarchiveObjectWithData:lastFeedRequestData];
//        } @catch (NSException *exception) {
//        } @finally {
//        }
//    }
//    return last;
//}

- (void)setTemplateID:(NSString *)templateID
        topicPresetID:(NSString *)topicPresetID {
    [self setDomainCacheValue:templateID
                          key:[NSString
                               stringWithFormat:@"%@_%@", topicPresetID,
                               kCacheTopicPresetTemplateId]
                        level:SyCacheLevelCommunity];
}

- (NSString *)getTemplateIDWithTopicPresetID:(NSString *)topicPresetID {
    return [self
            domainCacheValue:[NSString stringWithFormat:@"%@_%@", topicPresetID,
                              kCacheTopicPresetTemplateId]
            level:SyCacheLevelCommunity];
}

- (void)removeFormal {
    [[NSUserDefaults standardUserDefaults]
     removePersistentDomainForName:@"formal"];
    [[NSUserDefaults standardUserDefaults]
     removePersistentDomainForName:@"experience"];
}

- (void)removeExperience {
    [[NSUserDefaults standardUserDefaults]
     removePersistentDomainForName:@"experience"];
}

- (void)removeServerInfo {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:VarName(authHost)];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:VarName(authHostExp)];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:VarName(webHost)];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:VarName(webShort)];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:VarName(mobileHost)];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:VarName(mobileHostExp)];
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:VarName(versionHost)];
}

- (void)cacheMigration {
    NSString *accessToken =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"];
    if (accessToken) {
        self.accessToken = accessToken;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"access_token"];
    }
    NSString *refreshToken =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"refresh_token"];
    if (refreshToken) {
        self.refreshToken = refreshToken;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"refresh_token"];
    }
    
    NSString *personID =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"login_personID"];
    if (personID) {
        self.personID = personID;
        [[NSUserDefaults standardUserDefaults]
         removeObjectForKey:@"login_personID"];
    }
    NSString *personName =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"login_personName"];
    if (personName) {
        self.personName = personName;
        [[NSUserDefaults standardUserDefaults]
         removeObjectForKey:@"login_personName"];
    }
    
    long long expires_in = [[[NSUserDefaults standardUserDefaults]
                             objectForKey:@"expires_in"] longLongValue];
    if (expires_in > 0) {
        self.expires_in = expires_in;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"expires_in"];
    }
    NSString *communityID =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"communityID"];
    if (communityID) {
        self.communityID = communityID;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"communityID"];
    }
    NSString *communityName =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"communityName"];
    if (communityName) {
        self.communityName = communityName;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"communityName"];
    }
    NSString *communityLogo =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"communityLogo"];
    if (communityLogo) {
        self.communityLogo = communityLogo;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"communityLogo"];
    }
    NSString *communityShortChain = [[NSUserDefaults standardUserDefaults]
                                     objectForKey:@"communityShortChain"];
    if (communityShortChain) {
        self.communityShortChain = communityShortChain;
        [[NSUserDefaults standardUserDefaults]
         removeObjectForKey:@"communityShortChain"];
    }
    
    NSString *username =
    [[NSUserDefaults standardUserDefaults] objectForKey:@"kUserName2"];
    if (username) {
        self.username = username;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"kUserName2"];
    }
    
    BOOL mainGuideOpened = [[[NSUserDefaults standardUserDefaults]
                             objectForKey:@"ExperienceGuideOpened"] boolValue];
    if (mainGuideOpened) {
        self.mainGuideOpened = mainGuideOpened;
        [[NSUserDefaults standardUserDefaults]
         removeObjectForKey:@"ExperienceGuideOpened"];
    }
    BOOL feedGuideOpened = [[[NSUserDefaults standardUserDefaults]
                             objectForKey:@"GroupGuideOpened"] boolValue];
    if (feedGuideOpened) {
        self.feedGuideOpened = feedGuideOpened;
        [[NSUserDefaults standardUserDefaults]
         removeObjectForKey:@"GroupGuideOpened"];
    }
}

/**
 *  主缓存获取方法
 *
 *  @param value 缓存值
 *  @param key   缓存key
 *  @param level 缓存级别
 */
- (void)setCacheValue:(NSObject *)value
                  key:(NSString *)key
                level:(SyCacheLevel)level {
    NSString *cacheKey = [self cacheKey:key level:level];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:cacheKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  主缓存获取方法
 *
 *  @param key   缓存key
 *  @param level 缓存级别
 *
 *  @return 缓存值
 */
- (id)cacheValue:(NSString *)key level:(SyCacheLevel)level {
    NSString *cacheKey = [self cacheKey:key level:level];
    return [[NSUserDefaults standardUserDefaults] objectForKey:cacheKey];
}

/**
 *  域缓存设置方法
 *
 *  @param value 缓存值
 *  @param key   缓存key
 *  @param level 缓存级别
 */
- (void)setDomainCacheValue:(NSObject *)value
                        key:(NSString *)key
                      level:(SyCacheLevel)level {
    NSString *name;
    if (self.experienced) {
        name = [NSString stringWithFormat:@"experience"];
    } else {
        name = [NSString stringWithFormat:@"formal"];
    }
    NSDictionary *domain =
    [[NSUserDefaults standardUserDefaults] persistentDomainForName:name];
    NSMutableDictionary *dic;
    if (domain) {
        dic = [[NSMutableDictionary alloc] initWithDictionary:domain];
    } else {
        dic = [[NSMutableDictionary alloc] init];
    }
    NSString *cacheKey = [self cacheKey:key level:level];
    [dic setValue:value forKey:cacheKey];
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:dic forName:name];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  域缓存获取方法
 *
 *  @param key   缓存key
 *  @param level 缓存等级
 *
 *  @return 缓存值
 */
- (id)domainCacheValue:(NSString *)key level:(SyCacheLevel)level {
    NSString *domain;
    if (self.experienced) {
        domain = [NSString stringWithFormat:@"experience"];
    } else {
        domain = [NSString stringWithFormat:@"formal"];
    }
    return [self domainCacheValue:key level:level domain:domain];
}

/**
 *  域缓存获取方法
 *
 *  @param key   缓存key
 *  @param level 缓存等级
 *  @param domain 域名称
 *
 *  @return 缓存值
 */
- (id)domainCacheValue:(NSString *)key
                 level:(SyCacheLevel)level
                domain:(NSString *)domain {
    NSMutableDictionary *dic = (NSMutableDictionary *)
    [[NSUserDefaults standardUserDefaults] persistentDomainForName:domain];
    if (dic) {
        NSString *cacheKey = [self cacheKey:key level:level];
        return [dic objectForKey:cacheKey];
    } else {
        return nil;
    }
}

/**
 *  缓存key拼接
 *
 *  @param key   缓存key
 *  @param level 缓存登记
 *
 *  @return 缓存key
 */
- (NSString *)cacheKey:(NSString *)key level:(SyCacheLevel)level {
    switch (level) {
        case SyCacheLevelDefault:
            return [NSString stringWithFormat:@"%@", key];
            break;
        case SyCacheLevelUser:
            return [NSString stringWithFormat:@"%@_%@", self.personID, key];
            break;
        case SyCacheLevelCommunity:
            return [NSString
                    stringWithFormat:@"%@_%@_%@", self.personID, self.communityID, key];
            break;
        case SyCacheLevelDate:
            return [NSString stringWithFormat:@"%@_%@_%@_%@", self.personID,
                    self.communityID, [self nowDate], key];
            break;
        default:
            return nil;
            break;
    }
}

/**
 *  获取当前日期，如：2015_05_14
 *
 *  @return
 */
- (NSString *)nowDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:kDateFormate_YYYY_MM_DD];
    return [dateFormatter stringFromDate:[NSDate date]];
}



@end
