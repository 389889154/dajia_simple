//
//  UIWebView+JavaScriptAlert.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UIWebView+JavaScriptAlert.h"
#import "SyAlertView.h"
@implementation UIWebView (JavaScriptAlert)

static BOOL diagStat = NO;

- (void)webView:(UIWebView *)sender
runJavaScriptAlertPanelWithMessage:(NSString *)message
initiatedByFrame:(id)frame {
    SyAlertView *dialogue =
    [[SyAlertView alloc] initWithTitle:nil
                               message:message
                              delegate:nil
                     cancelButtonTitle:@"确定"
                     otherButtonTitles:nil, nil];
    [dialogue show];
    ;
}

- (BOOL)webView:(UIWebView *)sender
runJavaScriptConfirmPanelWithMessage:(NSString *)message
initiatedByFrame:(id)frame {
    SyAlertView *dialogue = [[SyAlertView alloc]
                             initWithTitle:nil
                             message:message
                             delegate:self
                             cancelButtonTitle:@"确定"
                             otherButtonTitles:@"取消", nil];
    [dialogue show];
    while (dialogue.hidden == NO && dialogue.superview != nil) {
        [[NSRunLoop mainRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01f]];
    }
    
    return diagStat;
}

- (void)alertView:(SyAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        diagStat = YES;
    } else if (buttonIndex == 1) {
        diagStat = NO;
    }
}

@end
