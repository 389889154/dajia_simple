//
//  SyAlertView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyAlertView.h"

@implementation SyAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message block:(AlertBlock)alertBlock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...{
    
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles , nil];
    if (otherButtonTitles) {
        va_list args;
        va_start(args, otherButtonTitles);
        NSString *arg = va_arg(args, NSString *);
        while (arg != nil) {
            [self addButtonWithTitle:arg];
            arg = va_arg(args, NSString *);
    }
           va_end(args);
    }
        self.alertBlock = alertBlock;
        return self;
}
    
- (void)alertViewCancel:(SyAlertView *)alertView {
    if (_alertBlock) {
        _alertBlock(0);
    }
}

- (void)alertView:(SyAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (_alertBlock) {
        _alertBlock(buttonIndex);
    }
}

@end
    
    
    

