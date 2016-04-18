//
//  SyFileManager.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/15.
//  Copyright © 2016年 weiSH. All rights reserved.
//

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

#define kDraftAttchmentPath @"Documents/draftAttchment" //草稿附件

@implementation SyFileManager
+ (SyFileManager *)shareInstance {
    static SyFileManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        _draftAttchmentPath =
        [[SyFileManager createPersetPath:kDraftAttchmentPath] copy];
        _fileOrgChart = [[SyFileManager createPersetPath:kFileOrgChart] copy];
        _faceImagePath = [[SyFileManager createPersetPath:kFaceImagePath] copy];
        _picturePath = [[SyFileManager createPersetPath:kPicturePath] copy];
        _voicePath = [[SyFileManager createPersetPath:kVoicePath] copy];
        _filePath = [[SyFileManager createPersetPath:kFilePath] copy];
        _portalTemplatePackagePath = [[SyFileManager createPersetPath:kPortalTemplatePath] copy];
    });
    return instance;
}

+ (NSString *)createPersetPath:(NSString *)aPath {
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:aPath];
    BOOL isDirectory = NO;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    if (isExist && !isDirectory) {
        // 判定与系统的文件冲突
        [NSException raise:@"FileExistsAtDownloadTempPath" format:@"Cannot create a directory for the downloadFileTempPath at "
         @"'%@', because a file already exists",path];
    }else if (!isExist) {
        // 建立目录
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        if (![[NSFileManager defaultManager]fileExistsAtPath:path]) {
            [NSException raise:@"creat failed" format:@"'%@'",path];
        }
    }
    return path;
}

@end
