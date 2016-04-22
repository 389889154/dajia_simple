//
//  SyBaseControl.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseControl.h"

@implementation SyBaseControl


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)setup
{
    //  SUBCLASS TODO
}


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self customLayoutSubviews];
    
}

- (CGFloat)viewHeight
{
    return 0;
}


- (void)customLayoutSubviews
{
    //  SUBCLASS TODO
}



@end
