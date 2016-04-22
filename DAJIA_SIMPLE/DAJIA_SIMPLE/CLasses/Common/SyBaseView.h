//
//  SyBaseView.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/18.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SyBaseView : UIView
@property(nonatomic, readonly) CGRect mainFrame;

- (void)setup;
- (void)customLayoutSubviews;
- (CGFloat)viewHeight;

+ (CGFloat)viewHeight;

//+ (CGFloat)viewHeight:(SyFeed *)feed lines:(NSInteger)lines;
@end
