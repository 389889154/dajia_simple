//
//  SyBaseView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/18.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseView.h"

@implementation SyBaseView
@synthesize mainFrame = _mainFrame;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (CGRect)mainFrame {
    return CGRectMake(0, 0, self.width, self.height);
}

- (void)setup {
    //  SUBCLASS TODO
}

- (CGFloat)viewHeight {
    return 0;
}

+ (CGFloat)viewHeight {
    return 0;
}

//+ (CGFloat)viewHeight:(SyFeed *)feed lines:(NSInteger)lines {
//#if defined(BUILD_TEST) | defined(DEBUG)
//    [NSException raise:@"Feed info type unknown！" format:@"%@", feed];
//#endif
//    return 0;
//}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self customLayoutSubviews];
}

- (void)customLayoutSubviews {
    //  SUBCLASS TODO
}
@end
