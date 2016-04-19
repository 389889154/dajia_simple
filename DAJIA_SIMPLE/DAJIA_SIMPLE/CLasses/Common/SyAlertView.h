//
//  SyAlertView.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertBlock)(NSInteger index);

@interface SyAlertView : UIAlertView <UIAlertViewDelegate>
@property (nonatomic, copy) AlertBlock alertBlock;

- (instancetype)initWithTitle:(NSString *)title
            message:(NSString *)message
              block:(AlertBlock)alertBlock
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
