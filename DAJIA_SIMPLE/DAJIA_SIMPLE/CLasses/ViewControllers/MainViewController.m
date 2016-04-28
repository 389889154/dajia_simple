//
//  MainViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/11.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "MainViewController.h"
#import "SyFileManager.h"

#define Khtml @"http://m.dajiashequ.com/dajia_mobile/mobile/portal/home/template?access_token=1d38229a-d508-4d26-ab6f-1e0a94397d1a&version=5.3.1&sourceVersion=0&communityID=778913468791490474930525"


@interface MainViewController ()
@property (nonatomic, strong) NSString *personID;
@property (nonatomic,strong) NSString *communityID;
@end

@implementation MainViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.personID = @"weish";
    self.communityID = @"778913468791490474930525";
    // 解压文件 从本地读
    [self UnzipAction];
    
}
- (void)UnzipAction {
    if(![[NSFileManager defaultManager] fileExistsAtPath:self.personID]){
    
    }
    
    NSString *zipPath = [[NSBundle mainBundle] pathForResource:@"portal" ofType:nil];
//    NSStrings *unZipPath = [SyFileManager portalTemplateUnzipPath:]
}

// 加载Html
- (void)loadHtmlContentWithPersonID:(NSString *)personID
                                communityID:(NSString *)communityID
                                    isCache:(BOOL)isCache{
    NSString *zipPath = [SyFileManager portalTemplateZipPath:self.personID];
#pragma mark --- 从本地读Html
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"778913468791490474930525_portal.html" ofType:nil];
    if ([[NSFileManager defaultManager] fileExistsAtPath:zipPath]) {
        NSString *mainPageContent = [[NSString alloc]initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
        NSURL *baseURL = [NSURL fileURLWithPath:[htmlPath stringByDeletingLastPathComponent]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (isCache) {
                _templateHandler(SyPortalCacheValid, mainPageContent, baseURL, 0);
            } else {
                _templateHandler(SyPortalLoadFinishedStatus, mainPageContent, baseURL, 0);
            }
        });
        
    }else {
        _templateHandler(SyPortalLoadFailStatus, nil, nil, 0);
    }
}




@end
