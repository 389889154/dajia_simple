//
//  SyFileManager.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/15.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyFileManager : NSObject
+(SyFileManager *)shareInstance;
+ (NSString *)createFullPath:(NSString *)aPath;
+ (NSString *)recordFilePathWithFileName:(NSString *)fileName
                               cleanFlag:(BOOL)flag;
+ (NSString *)orgChartFilePathWithCommunityID:(NSString *)communityID;

// 图片路径
+ (NSString *)faceImagePathWithUniqueId:(NSString *)uniqueId
                               sizeType:(NSInteger)sizeType;
+ (NSString *)picturePathWithPictureID:(NSString *)pictureID
                              sizeType:(NSInteger)type;

+ (BOOL)deleteFileWithfilePath:(NSString *)filePath;
// 删除头像缓存
+ (BOOL)deleteFaceImageWithUniqueId:(NSString *)uniqueId;

/**
 *  获取缓存文件目录的数组，其中包含所有带有时效性或用户可手动清除的缓存文件的目录
 *
 *  @return NSArray<NSString *>
 */
+ (NSArray *)cacheFilePaths;

/**
 *  获取临时文件存放的路径
 *
 *  @return
 */
+ (NSString *)fileTempPath;

/**
 *  获取Portal模板包得存放路径
 *
 *  @param cID 社区ID
 *  @param uID 用户ID
 *
 *  @return
 */
+ (NSString *)portalTemplateZipPath:(NSString *)personID;

/**
 *  获取Portal模板包解压路径
 *
 *  @param cID 社区ID
 *  @param uID 用户ID
 *
 *  @return
 */
+ (NSString *)portalTemplateUnzipPath:(NSString *)personID;

/**
 *  获取portal模板所在目录
 *
 *  @return
 */
+ (NSString *)portalTemplatePath:(NSString *)personID;

/**
 *  获取Portal模板包解压后的加载路径
 *
 *  @param cID 社区ID
 *  @param uID 用户ID
 *
 *  @return
 */
+ (NSString *)portalTemplateHtmlPath:(NSString *)personID
                         communityID:(NSString *)communityID;

///**
// *  获取Portal模板背景图片地址
// *
// *  @param cID 社区ID
// *  @param uID 用户ID
// *
// *  @return
// */
//+ (NSString *)portalTemplateBgImagePath:(NSString *)personID fileName:(NSString *)fileName;

/**
 *  获取首页数据缓存文件的路径
 *
 *  @param userID
 *  @param communityID
 *
 *  @return
 */
+ (NSString *)portalTemplateSourceCachePath:(NSString *)userID
                                communityID:(NSString *)communityID;

/**
 *  周期性清理头像缓存
 *
 *  @param timeInterval 周期
 */
- (void)cleanFaceCachePeriodically:(NSTimeInterval)timeInterval;

/**
 *  判断图片是否存在
 *
 *  @param pictureID
 *  @param type
 *
 *  @return nil图片不存在，string图片已存在
 */
+ (NSString *)existPicturePathWithPictureID:(NSString *)pictureID
                                   sizeType:(NSInteger)type;

+ (NSString *)voicePathWithID:(NSString *)voiceID suffix:(NSString *)suffix;

+ (NSString *)filePathWithFileID:(NSString *)fileID
                        fileName:(NSString *)fileName;

/**
 *  清除本地缓存
 */
- (void)cleanPath;

/**
 *  计算文件大小
 *
 *  @param folderPath
 *
 *  @return 文件的大小字符串
 */
- (NSString *)folderSizeStringAtPath:(NSString *)folderPath;
- (NSString *)folderSizeStringAtPaths:(NSArray *)array;


@end
