
//
//  DiscoverViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/11.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "DiscoverViewController.h"
#import "Model.h"
#import "SyURLConnection.h"
#import "SyWebView.h"
@interface DiscoverViewController ()<SyURLConnectionDelegate,UIScrollViewDelegate,UIWebViewDelegate>
@property (nonatomic, strong) SyWebView *webView;
@end

@implementation DiscoverViewController

- (SyWebView *)webView {
    if (!_webView) {
        _webView = [[SyWebView alloc] initWithFrame:self.view.frame];
        _webView.backgroundColor = [UIColor clearColor];
        _webView.opaque = NO;
        _webView.scrollView.delegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
