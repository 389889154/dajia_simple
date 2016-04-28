//
//  SyURLProvider.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/27.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseProvider.h"
#import "SyURLConnection.h"
//服务器业务接口
@class SyBaseRequest,SyBaseResponse;
@interface SyURLProvider : SyBaseProvider<SyURLConnectionDelegate>{
    SyURLConnection *_urlConnection;
}

@end
