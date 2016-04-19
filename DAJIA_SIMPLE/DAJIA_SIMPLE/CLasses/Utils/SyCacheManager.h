//
//  SyCacheManager.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/15.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyCacheManager : NSObject
+ (SyCacheManager *)sharedSyCacheManager;

+ (SyCacheManager *)sharedSyCacheManager;

@property(nonatomic, assign, readonly) BOOL formalExisted;

#pragma mark 服务器配置相关
@property(nonatomic, copy) NSString *webHost;
@property(nonatomic, copy) NSString *webHostExp;
@property(nonatomic, copy) NSString *webShort;
@property(nonatomic, copy) NSString *mobileHost;
@property(nonatomic, copy) NSString *mobileHostExp;
@property(nonatomic, copy) NSString *versionHost;
@property(nonatomic, copy) NSString *logHost;
@property(nonatomic, copy) NSString *tokenHost;
@property(nonatomic, copy) NSString *tokenHostExp;
@property(nonatomic, copy) NSString *communityCategory;

@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *password;

@property(nonatomic, copy) NSString *deviceToken;
@property(nonatomic, copy) NSString *appVersion;

/**
 *  首页html版本
 */
@property(nonatomic, strong) NSString *htmlID;

/**
 *  首页资源版本
 */
@property(nonatomic, assign) NSInteger sourceVersion;

/**
 *  字体适配比例
 */
@property(nonatomic, assign) float fontIndex;

/**
 *  当前语言
 */
@property(nonatomic, strong) NSString *languate;

/**
 * 右滑提示显示标识
 *
 */
@property(nonatomic, assign) NSInteger slidingGuideStatus;

/**
 *  融云IM提示
 */
@property(nonatomic, assign) BOOL showRongCloudAlert;

/**
 *  最后一次定位位置
 */
@property(nonatomic, copy) NSDictionary *lastLocation;

/**
 *  提示点击顶部状态栏提示计数
 */
@property(nonatomic, assign) NSInteger touchStatusBarCount;
/**
 *  服务单引导提示
 */
@property(nonatomic, assign) NSInteger serviceFormGuideOpened;

/**
 * 联系人提示
 */
@property(nonatomic, assign) BOOL connectGuideShowOpened;

/**
 *
 */
@property(nonatomic, assign) BOOL addMessageShowOpend;
/**
 *  正在体验标识
 */
@property(nonatomic, assign) BOOL experienced;

/**
 *  新安装App的引导状态
 *  只要是新安装的都要显示一次新安装引导
 *  如果当前版本没有引导那么就显示最近的一次版本引导
 */
@property(nonatomic, assign) BOOL setupGuide;
/**
 *  新升级App的引导状态
 *  每次更新版本的时候都要设置该状态，有引导就设置，没有引导就不设置
 *  该状态受setupGuide状态的限制，如果setupGuide设置了，新安装的就一定不会显示这个引导
 */
@property(nonatomic, assign) BOOL upgradeGuide;

/**
 *  是新下载的app
 */
@property(nonatomic, assign) BOOL downloadApp;

/**
 *  首页引导提示引导是否打开
 */
@property(nonatomic, assign) BOOL mainGuideOpened;

/**
 *  全部消息引导提示引导是否打开
 */
@property(nonatomic, assign) BOOL feedGuideOpened;

/**
 *  用户第一次使用编辑置顶范围功能时需要显示提示
 */
@property(nonatomic, assign) BOOL showRangeTip;

/**
 *  节省网络流量设置
 */
@property(nonatomic, assign) BOOL saveTrafficMode;

/**
 *  缓存数据是否迁移标记
 */
@property(nonatomic, assign) BOOL cahceMigrated;

/**
 *  微信是否已登录过
 */
@property(nonatomic, assign) BOOL weChatLogged;

/**
 *  体验环境状态记录
 */
@property(nonatomic, copy) NSDictionary *experienceDict;

/**
 *  皮肤颜色字典
 */
@property(nonatomic, copy) NSMutableDictionary *skinDictionary;

#pragma mark ＝＝＝＝＝＝＝＝需要清除＝＝＝＝＝＝＝＝

@property(nonatomic, copy) NSString *personID;
@property(nonatomic, copy) NSString *personName;
@property(nonatomic, copy) NSString *accessToken;
@property(nonatomic, copy) NSString *imAccessToken;
@property(nonatomic, copy) NSString *refreshToken;
@property(nonatomic, assign) long long expires_in;
@property(nonatomic, copy) NSString *communityID;
@property(nonatomic, copy) NSString *communityName;
@property(nonatomic, copy) NSString *communityLogo;
@property(nonatomic, copy) NSString *communityShortChain;
@property(nonatomic, assign) NSInteger isFilledCol;
@property(nonatomic, assign) NSInteger joinType;
@property(nonatomic, assign) NSInteger isPromptedCol;
@property(nonatomic, copy) NSString *colInfoFormID;
@property(nonatomic, strong) NSDictionary *openIDInfo;
@property(nonatomic, assign) NSInteger isColInfo;
@property(nonatomic, assign) NSInteger contactSetType;
/**
 *  角色名称
 */
@property(nonatomic, copy) NSString *roleName;

/**
 *  社区模版开启标记
 */
@property(nonatomic, assign) BOOL useTemplate;

/**
 *  是否已进入通知中心页面
 */
@property(nonatomic, assign) BOOL notificationOpened;

/**
 *  精选是否开启
 */
@property(nonatomic, assign) BOOL plazaEnabled;

/**
 *  当前用户当前社区第一次获取预置主题的标志,
 * YES表示没有获取过，NO表示已经获取过
 */
@property(nonatomic, assign) BOOL topicPersetObtained;

//上次浏览是精选，还是全部消息
@property(nonatomic, assign) NSInteger feedOrPlaza;

/**
 *  上次离开时消息界面停留在哪个位置，消息或者通知
 */
@property(nonatomic, assign) NSInteger msgOrNotice;
/**
 *  最近一次获取通讯录的时间, 依赖于communityID
 */
@property(nonatomic, copy) NSString *lastContactRequest;

/**
 *  最近一次获取社区配置信息的时间
 */
@property(nonatomic, copy) NSString *lastCommunityConfigRequest;

/**
 *  联系人头像清除时间
 */
@property(nonatomic, copy) NSString *faceCleanTime;
/**
 *  保存当前用户当前社区获取feed的时间
 *  用于从数据库中读取缓存数据后，上拉请求下一页时的maxTime
 */
//@property(nonatomic, copy) LastFeedRequest *lastFeedRequest;


@property(nonatomic, strong) NSArray *recentTopic;

/**
 *  社区扩展属性
 */
@property(nonatomic, strong) NSArray *communityBottoms;

/**
 *  社区级配置信息
 */
@property(nonatomic, strong) NSDictionary *communityParam;

/**
 * 当前用户在当前社区中的角色
 */
@property(nonatomic, strong) NSArray *rTypes;

/**
 *  社区签到属性
 */
@property(nonatomic, strong) NSDictionary *communitySign;

/**
 *  签到成功标识
 */
@property(nonatomic, strong) NSDictionary *signedInfo;

/**
 *  推送声音是否打开
 */
@property(nonatomic, assign) BOOL soundSwitch;

/**
 *  推送震动是否打开
 */
@property(nonatomic, assign) BOOL shakeSwitch;

/**
 *  设置当前主题的模版id
 *
 *  @param templateID    模版id
 *  @param topicPresetID 主题id
 */
- (void)setTemplateID:(NSString *)templateID
        topicPresetID:(NSString *)topicPresetID;
/**
 *  获取当前主题的模版id
 *
 *  @param topicPresetID 主题id
 *
 *  @return 模版id
 */
- (NSString *)getTemplateIDWithTopicPresetID:(NSString *)topicPresetID;

/**
 *  删除正式环境缓存
 */
- (void)removeFormal;
/*
 *  删除体验环境缓存
 */
- (void)removeExperience;

/**
 *  删除网络服务配置信息
 */
- (void)removeServerInfo;

/**
 *  缓存文件升级迁移
 */
- (void)cacheMigration;

@end
