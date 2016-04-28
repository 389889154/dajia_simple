//
//  SyFileManager.m
//  DaJiaCore
//
//  Created by zhengxiaofeng on 13-12-1.
//  Copyright (c) 2013年 zhengxiaofeng. All rights reserved.
//

#include "sys/stat.h"
#import "SyFileManager.h"
static NSString *_draftAttchmentPath;
static NSString *_fileOrgChart;
static NSString *_faceImagePath;
static NSString *_picturePath;
static NSString *_voicePath;
static NSString *_filePath;
static NSString *_portalTemplatePackagePath;

#define kFaceImagePath @"Documents/File/FaceImage"
#define kPicturePath @"Documents/File/Picture"
#define kFilePath @"Documents/File/File"
#define kVoicePath @"Documents/File/Voice"
#define kUploadImagesFilePath @"Documents/File/UploadTemp"
#define kFileTempPath @"Documents/File/temp"
#define kFileOrgChart @"Documents/File/orgChart"
#define kRecordPath @"Documents/File/Record"
#define kPortalTemplatePath @"Documents/File/PortalTemplate"

#define kPortalTemplateFileName @"portal.zip"

@interface SyFileManager () {
}

@end

@implementation SyFileManager

+ (SyFileManager *)defaultManager {
    static SyFileManager *fileManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        fileManagerInstance = [[self alloc] init];
        _draftAttchmentPath =
        [[SyFileManager createPersetPath:kDraftAttchmentPath] copy];
        _fileOrgChart = [[SyFileManager createPersetPath:kFileOrgChart] copy];
        _faceImagePath = [[SyFileManager createPersetPath:kFaceImagePath] copy];
        _picturePath = [[SyFileManager createPersetPath:kPicturePath] copy];
        _voicePath = [[SyFileManager createPersetPath:kVoicePath] copy];
        _filePath = [[SyFileManager createPersetPath:kFilePath] copy];
        _portalTemplatePackagePath =
        [[SyFileManager createPersetPath:kPortalTemplatePath] copy];
    });
    return fileManagerInstance;
}

+ (NSString *)createPersetPath:(NSString *)aPath {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:aPath];
    BOOL isDirectory = NO;
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path
                                                       isDirectory:&isDirectory];
    if (exists && !isDirectory) {
        [NSException
         raise:@"FileExistsAtDownloadTempPath"
         format:@"Cannot create a directory for the downloadFileTempPath at "
         @"'%@', because a file already exists",
         path];
    } else if (!exists) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:nil];
        if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [NSException raise:@"FailedToCreateCacheDirectory"
                        format:@"Failed to create a directory for the "
             @"downloadFileTempPath at '%@'",
             path];
        }
    }
    return path;
}

+ (NSString *)createFullPath:(NSString *)aPath {
    if ([aPath isEqualToString:kDraftAttchmentPath]) return _draftAttchmentPath;
    if ([aPath isEqualToString:kFileOrgChart]) return _fileOrgChart;
    if ([aPath isEqualToString:kFaceImagePath]) return _faceImagePath;
    if ([aPath isEqualToString:kPicturePath]) return _picturePath;
    if ([aPath isEqualToString:kVoicePath]) return _voicePath;
    if ([aPath isEqualToString:kFilePath]) return _filePath;
    if ([aPath isEqualToString:kPortalTemplatePath])
        return _portalTemplatePackagePath;
    return [SyFileManager createPersetPath:aPath];
}

// 录音临时文件
+ (NSString *)recordFilePathWithFileName:(NSString *)fileName
                               cleanFlag:(BOOL)flag {
    NSString *str = _draftAttchmentPath;
    str = [str stringByAppendingPathComponent:fileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:str] && flag) {
        [[NSFileManager defaultManager] removeItemAtPath:str error:nil];
    }
    
    return str;
}
+ (NSString *)orgChartFilePathWithCommunityID:(NSString *)communityID {
    NSString *str = _fileOrgChart;
    str = [str
           stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",
                                           communityID]];
    return str;
}

+ (NSString *)faceImagePathWithUniqueId:(NSString *)uniqueId
                               sizeType:(NSInteger)sizeType {
    NSString *type = nil;
    if (sizeType == kC_iUserAvatarSize_Small) {
        type = @"small";
    } else if (sizeType == kC_iUserAvatarSize_Big) {
        type = @"big";
    } else if (sizeType == kC_iUserAvatarSize_Code) {
        type = @"code";
    }
    
    NSString *str = _faceImagePath;
    str = [str stringByAppendingPathComponent:
           [NSString stringWithFormat:@"%@_%@.png", uniqueId, type]];
    return str;
}

+ (BOOL)deleteFileWithfilePath:(NSString *)filePath {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    return YES;
}

+ (BOOL)deleteFaceImageWithUniqueId:(NSString *)uniqueId {
    NSString *str = _faceImagePath;
    
    NSString *imageSmallPath =
    [str stringByAppendingPathComponent:
     [NSString stringWithFormat:@"%@_%@.png", uniqueId, @"small"]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageSmallPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:imageSmallPath error:nil];
    }
    
    NSString *imageBigPath =
    [str stringByAppendingPathComponent:
     [NSString stringWithFormat:@"%@_%@.png", uniqueId, @"big"]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageBigPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:imageBigPath error:nil];
    }
    
    NSString *imageCodePath =
    [str stringByAppendingPathComponent:
     [NSString stringWithFormat:@"%@_%@.png", uniqueId, @"code"]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageCodePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:imageCodePath error:nil];
    }
    return YES;
}

+ (NSString *)picturePathWithPictureID:(NSString *)pictureID
                              sizeType:(NSInteger)type {
    NSString *sizeType = nil;
    if (type == kC_iPicSize_Small) {
        sizeType = @"small";
    } else if (type == kC_iPicSize_Big) {
        sizeType = @"big";
    } else if (type == kC_iPicSize_Middle) {
        sizeType = @"middle";
    }
    
    NSString *str = _picturePath;
    str = [str stringByAppendingPathComponent:
           [NSString stringWithFormat:@"%@_%@.png", pictureID, sizeType]];
    return str;
}

+ (NSString *)existPicturePathWithPictureID:(NSString *)pictureID
                                   sizeType:(NSInteger)type {
    NSString *picPath =
    [SyFileManager picturePathWithPictureID:pictureID sizeType:type];
    if ([[NSFileManager defaultManager] fileExistsAtPath:picPath]) return picPath;
    return nil;
}

+ (NSString *)voicePathWithID:(NSString *)voiceID suffix:(NSString *)suffix {
    NSString *str = _voicePath;
    str = [str stringByAppendingPathComponent:
           [NSString stringWithFormat:@"%@.%@", voiceID, suffix]];
    return str;
}

+ (NSString *)filePathWithFileID:(NSString *)fileID
                        fileName:(NSString *)fileName {
    NSString *str = _filePath;
    str = [str stringByAppendingPathComponent:
           [NSString stringWithFormat:@"%@_%@", fileID, fileName]];
    return str;
}

+ (NSArray *)cacheFilePaths {
    return [NSArray
            arrayWithObjects:
            [NSHomeDirectory() stringByAppendingPathComponent:kFaceImagePath],
            [NSHomeDirectory() stringByAppendingPathComponent:kPicturePath],
            [NSHomeDirectory() stringByAppendingPathComponent:kFilePath], nil];
}

+ (NSString *)fileTempPath {
    return [SyFileManager createFullPath:kFileTempPath];
}

+ (NSString *)portalTemplateZipPath:(NSString *)personID {
    NSString *dirPath = [kPortalTemplatePath stringByAppendingPathComponent:personID];
    dirPath = [dirPath stringByAppendingPathComponent:@"zip"];
    NSString *packageDirPath = [SyFileManager createFullPath:dirPath];
    NSString *packageFilePath = [packageDirPath
                                 stringByAppendingPathComponent:kPortalTemplateFileName];
    return packageFilePath;
}

+ (NSString *)portalTemplateUnzipPath:(NSString *)personID {
    NSString *dirPath = [kPortalTemplatePath stringByAppendingPathComponent:personID];
    dirPath = [dirPath stringByAppendingPathComponent:@"portaltmp"];
    dirPath = [dirPath stringByAppendingPathComponent:@"uzip"];
    NSString *packageDirPath = [SyFileManager createFullPath:dirPath];
    return packageDirPath;
}

+ (NSString *)portalTemplatePath:(NSString *)personID {
    NSString *dirPath = [kPortalTemplatePath stringByAppendingPathComponent:personID];
    dirPath = [dirPath stringByAppendingPathComponent:@"portal"];
    NSString *packageDirPath = [SyFileManager
                                createFullPath:dirPath];
    return packageDirPath;
}

+ (NSString *)portalTemplateHtmlPath:(NSString *)personID
                         communityID:(NSString *)communityID {
    NSString *packageDirPath = [SyFileManager portalTemplatePath:personID];
    NSString *fileName = [NSString stringWithFormat:@"%@_portal.html", communityID];
    packageDirPath = [packageDirPath stringByAppendingPathComponent:fileName];
    return packageDirPath;
}

+ (NSString *)portalTemplateSourceCachePath:(NSString *)userID
                                communityID:(NSString *)communityID {
    NSString *subPath =
    [NSString stringWithFormat:@"source/%@/%@", userID, communityID];
    NSString *packageDirPath = [SyFileManager
                                createFullPath:[kPortalTemplatePath
                                                stringByAppendingPathComponent:subPath]];
    return [packageDirPath stringByAppendingPathComponent:@"source.json"];
}

- (void)cleanPath {
    [[NSFileManager defaultManager]
     removeItemAtPath:[NSHomeDirectory()
                       stringByAppendingPathComponent:kFaceImagePath]
     error:nil];
    [[NSFileManager defaultManager]
     removeItemAtPath:[NSHomeDirectory()
                       stringByAppendingPathComponent:kPicturePath]
     error:nil];
    [[NSFileManager defaultManager]
     removeItemAtPath:[NSHomeDirectory()
                       stringByAppendingPathComponent:kFilePath]
     error:nil];
    if ([SyCacheManager sharedSyCacheManager].experienced) {
        [[NSFileManager defaultManager]
         removeItemAtPath:[NSHomeDirectory()
                           stringByAppendingPathComponent:kFileOrgChart]
         error:nil];
    }
    
    [SyFileManager createPersetPath:kFaceImagePath];
    [SyFileManager createPersetPath:kPicturePath];
    [SyFileManager createPersetPath:kFileOrgChart];
    [SyFileManager createPersetPath:kFilePath];
}

- (void)cleanFaceCache {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *p = _faceImagePath;
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:p error:NULL];
    NSEnumerator *e = [contents objectEnumerator];
    NSString *filename;
    for (filename in e) {
        [fileManager removeItemAtPath:[p stringByAppendingPathComponent:filename]
                                error:NULL];
    }
}

- (void)cleanFaceCachePeriodically:(NSTimeInterval)timeInterval {
    NSDate *now = [NSDate date];
    NSString *lTime = [SyCacheManager sharedSyCacheManager].faceCleanTime;
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    if (lTime) {
        NSDate *oldDate = [dateformatter dateFromString:lTime];
        NSTimeInterval ti = [now timeIntervalSinceDate:oldDate];
        if (ti > timeInterval) {
            [self cleanFaceCache];
        }
    }
    NSString *nTime = [dateformatter stringFromDate:now];
    [SyCacheManager sharedSyCacheManager].faceCleanTime = nTime;
}

// 文件管理
- (NSString *)folderSizeStringAtPath:(NSString *)folderPath {
    long long folderSize = [self folderSizeAtPath:folderPath];
    if (folderSize < 1024) {
        return @"0K";
    } else if (folderSize / 1024.0 < 1024) {
        return [NSString stringWithFormat:@"%.2fK", folderSize / 1024.0];
    } else if (folderSize / 1024.0 / 1024.0 < 1024) {
        return [NSString stringWithFormat:@"%.2fM", folderSize / 1024.0 / 1024.0];
    } else if (folderSize / 1024.0 / 1024.0 / 1024.0 < 1024) {
        return [NSString
                stringWithFormat:@"%.2fG", folderSize / 1024.0 / 1024.0 / 1024.0];
    }
    return @"";
}

- (NSString *)folderSizeStringAtPaths:(NSArray *)array {
    long long folderSize = 0;
    for (int i = 0; i < array.count; i++) {
        folderSize += [self folderSizeAtPath:[array objectAtIndex:i]];
    }
    
    if (folderSize < 1024) {
        return @"0K";
    } else if (folderSize / 1024.0 < 1024) {
        return [NSString stringWithFormat:@"%.2fK", folderSize / 1024.0];
    } else if (folderSize / 1024.0 / 1024.0 < 1024) {
        return [NSString stringWithFormat:@"%.2fM", folderSize / 1024.0 / 1024.0];
    } else if (folderSize / 1024.0 / 1024.0 / 1024.0 < 1024) {
        return [NSString
                stringWithFormat:@"%.2fG", folderSize / 1024.0 / 1024.0 / 1024.0];
    }
    return @"";
}

- (long long)folderSizeAtPath:(NSString *)folderPath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator =
    [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        NSString *fileAbsolutePath =
        [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}

- (long long)fileSizeAtPath:(NSString *)filePath {
    struct stat st;
    if (lstat([filePath cStringUsingEncoding:NSUTF8StringEncoding], &st) == 0) {
        return st.st_size;
    }
    return 0;
}
@end
