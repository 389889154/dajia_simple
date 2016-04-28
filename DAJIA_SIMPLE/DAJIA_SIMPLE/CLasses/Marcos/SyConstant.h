//
//  SyConstant.h
//  DaJia
//
//  Created by zhengxiaofeng on 13-6-24.
//  Copyright (c) 2013年 zhengxiaofeng. All rights reserved.
//

#ifndef DaJia_SyConstant_h
#define DaJia_SyConstant_h

//---------------------------每次获取列表的条数
#define kPageListSize 30
#define kAllContactCount 10000 //这里修改成1000，每次获取1000，分页获取
#define kHotTopicCount 50

// shareExtension的组名
#define kGroupName @"group.com.seeyon.dajiashequ.shareext"
#define kJumpToDajiaUrl @"dajiashare111extension://"

//---------------------------error
#define kDajiaErrorDomain @"DajiaErrorDomain"
#define kServerErrorCode @"errorCode"
#define kServerErrorMessage @"errorMessage"
#define kServerErrorStack @"errorStack"
#define kServerExceptionID @"exceptionId"
#define kDajiaLocalErrorDomain @"DajiaLocalErrorDomain"
#define kAuthError @"error"
#define kDajiaAuthErrorDomain @"DajiaAuthErrorDomain"

#define kServerErrorInvalidToken 1003
#define kServerErrorParamerError 2005
#define kServerErrorFileMissed 2006
#define kServerErrorGroupForwardForbidden 2007
#define kServerErrorGroupNotificationProcessed 2008
#define kLocalErrorNoCommunity 4001
#define kAuthErrorInvalidGrant 5001
#define kServerErrorParameter 3000

#define kCommunityJoinType @"communityJoinType"
#define kCommunityJoinData @"communityJoinData"
#define kCommunityJoinType_Freedom @"1"
#define kCommunityJoinType_Apply @"2"

//---------------------------DB
#define kSyDBFileName @"SyDajiadb.db"

//------log cache
#define kAccess_token @"access_token"
#define kRefresh_token @"refresh_token"
#define kExpires_in @"expires_in"
#define kPersonID @"login_personID"
#define kPersonName @"login_personName"
#define kCommunityID @"communityID"
#define kCommunityName @"communityName"
#define kCommunityLogo @"communityLogo"
#define kPortalLogo @"portalLogo"
#define kPortalShortChain @"portalShortChain"
#define kCommunityShortChain @"communityShortChain"

#define kDeviceToken @"deviceToken"
#define kUserName @"kUserName2"
#define kPassWord @"kPassWord"
#define kCommunityCategory @"CommunityCategory"
#define kDaJiaExperienceFlag @"DaJiaExperienceFlag" // 体验服务标识
// flag
#define kShowSplashView @"kShowSplashView"

#define kPottalTypeSionCode 5

//消息推送设备类型
#define kClientType @"ios"

#define kUpdateStrategyNotNeedUpdate 0
#define kUpdateStrategyNeedUpdate 1
#define kUpdateStrategyMustUpdate 2
#define kVersionDB @"VersionDB" // 数据库版本

//清除头像缓存时长（秒）
#define kCleanFaceTime 28800

//--------FeedCreate
#define kFeedCreateType_Picture 1
#define kFeedCreateType_Text 2
#define kFeedCreateType_Voice 3
#define kFeedCreateType_TakePhoto 4
#define kFeedCreateType_TakeRecord 5
#define kFeedCreateLimitType_Persons 2 // 指定人
#define kFeedCreateLimitType_Group 3   // 指定组
#define kFeedCreateLimitType_Public 1  // 公开

#define kDropDownAnimationDuration 0.3

//----------------------SyTableView
#define kHeight_FooterView 60.0f // footer
#define kHeight_HeaderView 60.0f
#define kHeight_CellDefault 44.0f
#define kHeight_PullDown 65.0f
#define kHeight_PullUp 10.0f
#define kTableLastRefreshDate @"LastRefreshDate"
#define kCell_Select 1
#define kCell_UnSelect 2

#define kPullState_Pull 1
#define kPullState_Release 2
#define kPullState_Loading 3
#define kPullState_NoDataLoad 4

//关闭签到界面通知
#define kCloseSignInView @"closeSignIn"
//只有一个社区，并且编辑删除后，退出用户后，换用户，加入社区页，没有被dismiss
#define kDismissJoinComunity @"dismisJoin"
//刷新全部消息
#define kRefeshAllFeedList @"freshFeedList"
//------------------------------NSNotification
//在应用开启状态下，shareExtension跳转到应用，发送推入选择社区页，通知
//#define kPopConmunityPage @"shareExtenToCommunityPage"
#define kGridPictrureImageViewTouch @"gridPictrureImageViewTouch"
#define kZoomViewSingleTap @"zoomViewSingleTap"
#define kRefreshCenterDrawerCollect @"refreshCenterDrawerCollect"
#define kRefreshCenterDrawerListForPraise @"refreshCenterDrawerListForPraise"
#define kPersonListForReadFeedAction @"personListForReadFeedAction"
#define kCommentIntoDetail @"commentIntoDetail"
#define kPraiseGroupAction @"praiseGroupAction"
#define kFaceViewShowInfoAction @"faceViewShowInfoAction"
#define kFeedCellGroupAction @"FeedCellGroupAction"
#define kOpenAttachFileOnWebView @"openAttachFileOnWebView"
#define kFeedPlaySoundAction @"feedPlaySoundAction"
#define kRichTextViewAction @"richTextViewAction"
#define kTagNameAction @"tagNameAction"
#define kFormViewButtonAction @"kFormViewButtonAction"
#define kLocationViewButtonAction @"kLocationViewButtonAction"
#define kLoadMoreRecommendGroup @"loadMoreRecommendGroup"
#define kRecommendGroupDetail @"recommendGroupDetail "
#define kGroupMemberCellAttentionButton @"GroupMemberCellAttentionButton"
#define kGroupSpaceJoinAndQuitAction @"groupSpaceJoinAndQuitAction"
#define kXMPSoundPlayerDidFinished @"kXMPSoundPlayerDidFinished"
#define kXMPSoundPlayerDuration @"kXMPSoundPlayerDuration"
#define kFeedCreateAttachItemPreviewAction @"feedCreateAttachItemPreviewAction"
#define kFeedCreateAttachItemDeleteAction @"feedCreateAttachItemDeleteAction"
#define kFeedCreateLocationItemDeleteAction                                    \
@"feedCreateLocationItemDeleteAction"
#define kFeedCreateLocationItemEditAction @"feedCreateLocationItemEditAction"
#define kChoosePersionAction @"choosePersionAction"
#define kRereshChoosePersionAction @"rereshChoosePersionAction"
#define kSionCodeImageViewFefreshAction @"sionCodeImageViewFefreshAction"
#define kSyVoiceButtonAnimatingAction @"syVoiceButtonAnimatingAction"
#define kFaceViewShowCardAction @"kFaceViewShowCardAction"
#define kAppsTopScrollViewAction @"kAppsTopScrollViewAction"

#define kChangeSkin @"kChangeSkin"
#define kChangeTabBar @"kChangeTabBar"
#define kDismissJoinCommunityController @"kDismissJoinCommunityController"

//程序返回后台
#define KapplicationWillResignActiveNotification                               \
@"UIApplicationWillResignActiveNotification"
#define KapplicationDidEnterBackgroundNotification                             \
@"UIApplicationDidEnterBackgroundNotification"

#define kFeedCommentAttachItemDeleteAction @"feedCommentAttachItemDeleteAction"
#define kFaceViewAction @"faceViewAction"
//#define kUnreadFeedCountNotification @"unreadFeedCountNotification"
#define kNotificationLinkAction @"notificationLinkAction"
//轮询应用页未读消息数据返回时，发送通知进行刷新
#define kUnreadInPresetMenu @"presetMenuUnread"

//群组详情内，删除信息流，发送通知，删除缓存中的feed，并reload列表
#define kDeleteGroupFeedCache @"deleteGroupFeed"

#define kOpenSMSView @"openSMSView"
#define kOpenPhoneView @"openPhoneView"
#define kOpenMailView @"openMailView"
#define kFileDownLoadFailed @"fileDownLoadFailed"

#define kOpenAtView @"openAtView"
#define kCommunicationFatherController @"communicationFatherController"
#define kSMSMessage @"SMSMessage"
#define kSMSPerson @"SMSPerson"
#define kPhoneNumber @"PhoneNumber"
#define kMailAddress @"MailAddress"
#define kAtPersonID @"AtPersonID"
#define kAtPersonName @"AtPersonName"
#define kRichTextCancelSelectedBackground @"richTextCancelSelectedBackground"
#define kChageCommunityAfterJoin @"chageCommunityAfterJoin"
#define kFileOpenDelete @"fileOpenDelete"
#define kDownloadFailed @"downloadFailed"
#define kDownloadSuccess @"downloadSuccess"
#define kFeedBlogContentShowAction @"feedBlogContentShowAction"
#define kFileOpenButtonShowAction @"fileOpenButtonShowAction"

#define kTouchStatusBar @"touchStatusBar"
#define kTouchStatusBarTipString @"点击此处返回顶部"

//------------------------net support
#define kConnectionToServerForDownload_TimeOut 300.0
#define kRecord_TimeOut 300
#define kVoice_TimeOut 120
#define kDownloadFile_AllowCompressed YES
#define kDownloadRequestCachePolicy_OnlyLoadIfNotCached 1
#define kUIDeviceNet_Invalid 1 // 没有网络
#define kUIDeviceNet_WiFi 2    // WIFI
#define kUIDeviceNet_3G 3      // 3G
#define kCleanData_Flag @"CleanData"
#define kExperiencing_Flag @"Experiencing"

//------------------------file path
#define kVoiceUnit 4000 // 语音单位
#define kSourceRecordFileName @"recordTemp.caf"
#define kDestinationRecordFileName @"recordTemp.amr"
#define kDestinationRecordingFileName @"recording.amr"

#define kDraftAttchmentPath @"Documents/draftAttchment" //草稿附件
//------------------------file type
#define kFileType_Image 1 // 图像文件
#define kFileType_Audio 2 // 音频文件
#define kFileType_Movie 3 // 视频
#define kFileType_File 4  // 附件

//-------------------------sever constants
#define kC_sInfoType_Feed @"1"      // Feed来源-信息流，值为："1"
#define kC_sInfoType_Blog @"2"      // Feed来源-博客
#define kC_sInfoType_Document @"3"  // Feed来源-文档
#define kC_sInfoType_Other @"4"     // Feed来源-动作流，值为："4"
#define kC_sInfoType_Blog_Feed @"5" // 博客
#define kC_sInfoType_Activity @"6"  // 活动
#define kC_sInfoType_Image @"7"     // 图册
#define kC_sInfoType_Sina @"8"      // 新浪微博
#define kC_sInfoType_Tencent @"9"   // 腾讯微博
#define kC_sInfoType_Task @"10"     // 工作看板
#define kC_sInfoType_Form @"11"     // 主题表单
#define kC_sInfoType_RichText @"13" // 服务推送类型

#define feedType                                                               \
[NSString stringWithFormat:@"%@,%@,%@,%@,%@", kC_sInfoType_Feed,             \
kC_sInfoType_Blog_Feed, kC_sInfoType_Form,        \
kC_sInfoType_Document, kC_sInfoType_RichText]

//网页链接类型
#define kC_sFeedWebType_Web 0    //普通网页
#define kC_sFeedWebType_Survey 1 //调查类表单
#define kC_sFeedWebType_Topic 2  //主题网页
#define kC_sFeedWebType_Blog 3   //博客网页
#define kC_sFeedWebType_Portal 4 //官网网页

#define kCommunityJoinData @"communityJoinData"
#define kProviderCommunityID @"kProviderCommunityID"

#define kC_iUserAvatarSize_Small 1   // 头像图片尺寸-小
#define kC_iUserAvatarSize_Big 2     // 头像图片尺寸-大
#define kC_iUserAvatarSize_Code 3    // 二维码图片
#define kC_iPicSize_Small 1          // 图片尺寸-小，值为：1
#define kC_iPicSize_Big 2            // 图片尺寸-大，值为：2
#define kC_iPicSize_Middle 3         // 图片尺寸-中，值为：3
#define kC_iCommentSourceType_Feed 1 // 被评论对象类型-feed
#define kC_iCommentSourceType_Blog 2 // 被评论对象类型-博客

#define kC_iGroupJoinType_Freedom 25  // 群组加入方式--自由
#define kC_iGroupJoinType_Apply 26    // 群组加入方式--申请或邀请
#define kC_iGROUP_QUITTYPE_FREEDOM 27 // 群组退出方式--自由
#define kC_iGROUP_QUITTYPE_APPLY 28   // 群组退出方式--申请或邀请

#define kC_iGroupJoin_Have 1009       // 已经加入群组
#define kC_iGroupJoin_Apply 1008      // 申请加入群组
#define kC_iGroupJoin_Quit 1010       // 申请退出
#define kC_iGroupJoin_Invite 1011     // 邀请加入群组
#define kC_iGroupJoin_Reject 1012     // 拒绝加入群组
#define kC_sGroupInOutType_Apply @"1" // 群组加入退出类型-需申请
#define kC_sGroupInOutType_Open @"2"  // 群组加入退出类型-开放
#define kC_sGroupSearchScope_All @"1" // 群组搜索范围-全社区，值为："1"
#define kC_sGroupSearchScope_Join @"2" // 群组搜索范围-当前用户加入的，值为："2"
#define kC_sGroupStatusClosed 32 // 群组已经关闭

#define kC_iFileFrom_Feed 0       // 文件来源-Feed
#define kC_iFileFrom_Other 1      // 文件来源-其他
#define kC_sInviteType_Group @"1" // 邀请类型-群组

#define kDealResult_Agree 3001  // 同意
#define kDealResult_Refuse 3002 // 拒绝
#define kDealResult_Ignore 3003 // 忽略

//-------------------------日期格式宏
//时间一律采用24小时制，如果有需要12小时制的请注明
#define kDateFormate_YYYYMMDDHHMMSS @"yyyyMMddHHmmss" // 20130122202240
#define kDateFormate_yyyy_MM_dd_HH_mm_ss                                       \
@"yyyy-MM-dd HH:mm:ss" // 2013-01-22 20:22:40
#define kDateFormate_yyyy_MM_dd_HH_mm_ss_SSS                                   \
@"yyyy-MM-dd HH:mm:ss.SSS" // 2013-01-22 20:22:40.301

//#define kDateFormate_YYYY_MM_DD_HH_MM_PM \
//  @"yyyy-MM-dd hh:mm a"  // 2013-01-22 20:22 AM/PM
#define kDateFormate_YYYY_MM_DD_HH_MM @"yyyy-MM-dd HH:mm" // 2013-01-22 20:22
#define kDateFormate_YYYY_MM_DD @"yyyy-MM-dd"             // 2013-01-22
#define kDateFormate_YYYY_MM @"yyyy-MM"                   // 2013-01

//-------------------------语音视频宏
#define GetAmrPath(_file)                                                      \
[NSString stringWithFormat:@"%@/%@", GetAmrDirectory, _file]
#define GetAmrDirectory                                                        \
[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/.AppData/Amr"]

/*
 增量更新 不用 只传maxTime
 打开图片失败 给默认图片
 
 多账号做区分
 默认头像 修改
 
 1008 申请加入中 1009 已加入 1010 申请退出中 1011 被邀请加入
 
 1011 空 加入
 1009，1011 已加入
 
 */

#pragma mark -个人中心、群组详情
#define kListType_Attention 0
#define kListType_Fans 1

#pragma mark - 状态值
#define kSyState_Selected_Yes 1 // 未选中
#define kSyState_Selected_No 2  // 选中
#define kSyState_IsNew_Yes 1    // 新的
#define kSyState_IsNew_No 2     // 旧的
#define kSyState_IsLocal_Yes 1  // 本地
#define kSyState_IsLocal_No 2   // 非本地
#pragma mark - 二维码

#pragma mark - 导航
#define kLeftSide_Home @"个人中心"
#define kLeftSide_Group @"群组"
#define kLeftSide_Contact @"联系人"
#define kLeftSide_Invate @"邀请"
#define kLeftSide_Scanning @"扫一扫"
#define kLeftSide_Setting @"设置"

#define kLeftSide_UniqueCode_Home @"header.topMenu.personCenter"
#define kLeftSide_UniqueCode_Group @"header.topMenu.group"
#define kLeftSide_UniqueCode_Contact @"header.topMenu.workQ"
#define kLeftSide_UniqueCode_Scanning @"header.topMenu.scan"
#define kLeftSide_UniqueCode_Invite @"header.topMenu.invite"
#define kLeftSide_UniqueCode_Set @"dajia_leftside_set"
#define kLeftSide_UniqueCode_Personal @"dajia_leftside_personal"

#define kLeftSide_UniqueCode_Document @"common_iconLeft26_document" //云盘
#define kLeftSide_UniqueCode_Blog @"common_iconLeft26_blog"         //博客
#define kLeftSide_UniqueCode_Activity @"common_iconLeft26_activity" //活动
#define kLeftSide_UniqueCode_Board @"common_iconLeft26_board"     //工作看板
#define kLeftSide_UniqueCode_Plan @"common_iconLeft26_plan"       //计划
#define kLeftSide_UniqueCode_Report @"common_iconLeft26_report"   //日报
#define kLeftSide_UniqueCode_CheckIn @"common_iconLeft26_checkIn" //考勤
#define kLeftSide_UniqueCode_Default @"common_iconLeft26_default" //默认
#define kLeftSide_UniqueCode_Weibo @"common_iconLeft26_Weibo" //社交连接器
#define kLeftSide_UniqueCode_Album @"common_iconLeft26_album" //图片
#define kLeftSide_UniqueCode_News @"common_iconLeft26_news"   //新闻
#define kLeftSide_UniqueCode_Share @"common_iconLeft26_share" //分享
#define kLeftSide_UniqueCode_Form @"common_iconLeft26_form"   //表单

#define kLeftSide_UniqueCode_Record @"sm.menu.mobile.record" //打开录音
#define kLeftSide_UniqueCode_Photograph @"sm.menu.mobile.photograph" //打开相册
#define kLeftSide_UniqueCode_location @"sm.menu.mobile.location" //直接定位
#define kLeftSide_UniqueCode_RichText @"sm.menu.richtext" // richtext类型

#define kLeftSide_UniqueCode_CaseShare @"common_iconLeft26_caseShare" //案例分享
#define kLeftSide_UniqueCode_plugInTrade @"common_iconLeft26_plugInTrade"
#define kLeftSide_UniqueCode_loanApply @"common_iconLeft26_loanApply"
#define kLeftSide_UniqueCode_activityApply @"common_iconLeft26_activityApply" //
#define kLeftSide_UniqueCode_workStudy @"common_iconLeft26_workStudy"
#define kLeftSide_UniqueCode_levelTest @"common_iconLeft26_levelTest"
#define kLeftSide_UniqueCode_music @"common_iconLeft26_music" //

#define kLeftSide_UniqueCode_PartyApply @"common_iconLeft26_PartyApply"
#define kLeftSide_UniqueCode_circularize @"common_iconLeft26_circularize"
#define kLeftSide_UniqueCode_psychoConsulting                                  \
@"common_iconLeft26_psychologicalConsulting"
#define kLeftSide_UniqueCode_industryTrends @"common_iconLeft26_industryTrends"
#define kLeftSide_UniqueCode_studentUnion @"common_iconLeft26_studentUnion"
#define kLeftSide_UniqueCode_practice @"common_iconLeft26_practice"

#define kLeftSide_UniqueCode_show @"common_iconLeft26_show"
#define kLeftSide_UniqueCode_math @"common_iconLeft26_math"
#define kLeftSide_UniqueCode_weeklyReport @"common_iconLeft26_weeklyReport"
#define kLeftSide_UniqueCode_eduAnnouncement                                   \
@"common_iconLeft26_educationAnnouncement"
#define kLeftSide_UniqueCode_aboutUs @"common_iconLeft26_aboutUs"
#define kLeftSide_UniqueCode_broadcast @"common_iconLeft26_broadcast"

#define kLeftSide_UniqueCode_meetingArrange @"common_iconLeft26_meetingArrange"
#define kLeftSide_UniqueCode_scholarship @"common_iconLeft26_scholarship"
#define kLeftSide_UniqueCode_eduConsulting                                     \
@"common_iconLeft26_educationalConsulting"
#define kLeftSide_UniqueCode_techSchedule @"common_iconLeft26_teachingSchedule"
#define kLeftSide_UniqueCode_eduSchedule @"common_iconLeft26_educationSchedule"
#define kLeftSide_UniqueCode_employment @"common_iconLeft26_employment"

#define kLeftSide_UniqueCode_technologyDiscuss                                 \
@"common_iconLeft26_technologyDiscuss"
#define kLeftSide_UniqueCode_demand @"common_iconLeft26_demand"
#define kLeftSide_UniqueCode_mobileportal @"common_iconLeft26_mobileportal"

#define kLeftSide_UniqueCode_classSituation @"common_iconLeft26_classSituation"
#define kLeftSide_UniqueCode_portInfo @"common_iconLeft26_portInfo"
#define kLeftSide_UniqueCode_wonderfulThinking                                 \
@"common_iconLeft26_wonderfulThinking"
#define kLeftSide_UniqueCode_attendance @"common_iconLeft26_attendance"
#define kLeftSide_UniqueCode_shits @"common_iconLeft26_shits"
#define kLeftSide_UniqueCode_league @"common_iconLeft26_league"
#define kLeftSide_UniqueCode_file @"common_iconLeft26_file"
#define kLeftSide_UniqueCode_question @"common_iconLeft26_question"
#define kLeftSide_UniqueCode_marketReport @"common_iconLeft26_marketReport"
#define kLeftSide_UniqueCode_industryInsight                                   \
@"common_iconLeft26_industryInsight"
#define kLeftSide_UniqueCode_questionAnswer @"common_iconLeft26_questionAnswer"
#define kLeftSide_UniqueCode_onlineClass @"common_iconLeft26_onlineClass"
#define kLeftSide_UniqueCode_showAndShare @"common_iconLeft26_showAndShare"
#define kLeftSide_UniqueCode_talkingBook @"common_iconLeft26_talkingBook"
#define kLeftSide_UniqueCode_vote @"common_iconLeft26_vote"

#define kchangeComunity @"changeComunity"

//NS_ENUM(NSInteger, SyNotificationViewType){
//    SyNoticeViewTypeUndefined,           //  @"未定义"
//    SyNoticeViewTypeNewest,  //  @"最新通知"
//    SyNoticeViewTypeAt,      //  @"@提到我的"
//    SyNoticeViewTypeComment, //  @"评论"
//    SyNoticeViewTypeRequest, //  @"请求通知"
//    SyNoticeViewTypeSystem,  //  @"系统提醒"
//};
//**********************************************************************//
// 下面是方法宏
//**********************************************************************//

//---------------------------数字宏
#pragma mark Number宏
#define FloatNumber(n) [NSNumber numberWithFloat:n]
#define DoubleNumber(n) [NSNumber numberWithDouble:n]
#define BoolNumber(n) [NSNumber numberWithBool:n]
#define IntegerNumber(n) [NSNumber numberWithInteger:n]

#define SY_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SY_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//---------------------------设备宏
// iphone4、iphone4s、ipad模式下
#define SY_320x480                                                             \
((double)[[UIScreen mainScreen] bounds].size.height < (double)568)

// iphone5、iphone5s、iphone5c、iphone6放大模式下
#define SY_320x568                                                             \
(([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)

// iphone6标准模式下、iphone6 plus放大模式下
#define SY_375x667                                                             \
(667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

// iphone6 plus标准模式下
#define SY_414x736                                                             \
(736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

//---------------------------系统宏
#define SY_LEAST_IOS6                                                          \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 ? YES : NO)
#define SY_LEAST_IOS7                                                          \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define SY_LEAST_IOS8                                                          \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#define SY_LEAST_IOS9 \
([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? YES : NO)

//---------------------------设备信息宏
#define SY_APP_NAME                                                            \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define SY_APP_VERSION                                                         \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define SY_APP_SHORTVERSION                                                    \
[[[NSBundle mainBundle] infoDictionary]                                      \
objectForKey:@"CFBundleShortVersionString"]
#define SY_APP_BUNDLEVERSION                                                   \
[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define SY_DEVICE_UNIQUEIDENTIFIER [[UIDevice currentDevice] uniqueIdentifier]
#define SY_DEVICE_NAME [[UIDevice currentDevice] name]
#define SY_DEVICE_SYSTEMNAME [[UIDevice currentDevice] systemName]
#define SY_DEVICE_SYSTEMVERSION [[UIDevice currentDevice] systemVersion]
#define SY_DEVICE_MODEL [[UIDevice currentDevice] model]
#define SY_DEVICE_LOCALIZEMODEL [[UIDevice currentDevice] localizedModel]

//进入二级页后退时的请求规则
enum {
    SyRerequestFlagPending = 0,    //根据其他情况而定
    SyRerequestFlagNO = 2,         //不刷新
    SyRerequestFlagImmediately = 1 //立即刷新
};

const static NSInteger SyRerequestFeedInterval =
600; //刷新feed的时间间隔是10分钟
const static NSInteger SyRerequestContaceInterval =
8 * 60 * 60; //刷新feed的时间间隔是8小时
const static NSInteger SyRerequestCommunityConfigInterval =
1 * 60; //刷新社区配置信息的时间间隔是半小时

const static NSString *SyPaymentTypeAlipay = @"101";
const static NSString *SyPaymentTypeWeChat = @"201";

/**
 *  静态字符串常量
 *
 *  @param name 代码中引用的名字
 *  @param value 实际的值，将来也可能演变成从配置文件中读取时使用的Key
 *
 *  @return 返回const static NSString *
 */
#define CONST_SATAIC_NSSTRING(name, value) const static NSString *name = value;

/**
 *  定制版使用的字符串
 *
 *  @param name name 代码中引用的名字
 *  @param value 实际的值，将来也可能演变成从配置文件中读取时使用的Key
 *
 *  @return
 */
#define CUSTOMIZATION_NSSTRING(name, value) const static NSString *name = value;
/******************************************************************************/
/**
 *  代码中使用的字符串常量
 */
CONST_SATAIC_NSSTRING(SY_APP_ICON_FOR_EMPTY, @"说话气泡") //无消息的空提示
CONST_SATAIC_NSSTRING(SY_NO_MESSAGE, @"暂无消息")

#define SyShareToEmailNote                                                     \
[NSString stringWithFormat:@"来自%@的分享-", SY_APP_NAME]
#define SyShareToSMSNote                                                       \
[NSString stringWithFormat:@"来自%@的分享：", SY_APP_NAME]
#define SyShareToWeiboNote                                                     \
[NSString stringWithFormat:@"#来自%@的分享#", SY_APP_NAME]

#define SyRemindToAppStoreJudge                                                \
[NSString stringWithFormat:                                                  \
@"用户小佳觉得%@不错，你也给个评价吧！",      \
SY_APP_NAME]
CONST_SATAIC_NSSTRING(SY_LATER_TO_SAY_AGAIN, @"稍后再说")
CONST_SATAIC_NSSTRING(SY_JUDGE_NOW, @"现在去评价")

/******************************************************************************/

//选人/At人列表类型
#define kListType_RecentlyList 1
#define kListType_ContactList 2
#define kListType_Search 3
#define kListType_Group 4
#define kListType_GroupSearch 5

//分享类型
const static NSString *WEIXINPENGYOU = @"WEIXINPENGYOU";
const static NSString *WEIXINPENGYOUQUAN = @"WEIXINPENGYOUQUAN";
const static NSString *XINLANGWEIBO = @"XINLANGWEIBO";
const static NSString *TENGXUNWEIBO = @"TENGXUNWEIBO";
const static NSString *QQKONGJIAN = @"QQKONGJIAN";
const static NSString *QQ = @"QQ";
const static NSString *DUANXIN = @"DUANXIN";
const static NSString *YOUJIAN = @"YOUJIAN";

typedef const NSString *SyBusinessModuleCode;
#endif