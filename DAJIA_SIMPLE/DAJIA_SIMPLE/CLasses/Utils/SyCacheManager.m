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

@implementation SyCacheManager

+ (SyCacheManager *)sharedSyCacheManager {
    static SyCacheManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

#pragma mark --- 应用版本
- (void)setAppVersion:(NSString *)appVersion {
    [self setCacheValue:appVersion key:appVersion level:SyCacheLevelDefault];
}



#pragma mark ---- 缓存获取方法
- (void)setCacheValue:(id)value key:(NSString *)key level:(SyCacheLevel)level {
    
    NSString *cacheKey = [self cacheKey:key level:level];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:cacheKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)cacheValue:(NSString *)key level:(SyCacheLevel)level {
    NSString *cacheKey = [self cacheKey:key level:level];
    return [[NSUserDefaults standardUserDefaults] objectForKey:cacheKey];
}
- (NSString *)cacheKey:(NSString *)key level:(SyCacheLevel)level {

    switch (level) {
        case SyCacheLevelDefault:
            return [NSString stringWithFormat:@"%@",key];
            break;
            
            case SyCacheLevelUser:
            return [NSString stringWithFormat:@"%@_%@",self.personID,key];
            break;
            
            case SyCacheLevelDate:
            return [NSString stringWithFormat:@"%@_%@_%@_%@",self.personID,self.communityID,[self nowDate],key];
            break;
            
            case SyCacheLevelCommunity:
            return [NSString stringWithFormat:@"%@_%@_%@",self.personID,self.communityID,key];
            break;
        
        default:
            return nil;
            break;
    }
}

- (NSString *)nowDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd" ];
    return [dateFormatter stringFromDate:[NSDate date]];
}


@end
