//
//  MainViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/11.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation MainViewController


- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.frame];
        NSString *htmlStr = [[NSBundle mainBundle] pathForResource:@"778913468791490474930525_portal.html" ofType:nil];
        NSURL *baseUrl = [NSURL fileURLWithPath:htmlStr];
        NSString *mainPageContent = [[NSString alloc]initWithContentsOfFile:htmlStr encoding:NSUTF8StringEncoding error:nil];
        [_webView loadHTMLString:mainPageContent baseURL:baseUrl];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
