//
//  UIScrollView+AllowPanGestureEventPass.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UIScrollView+AllowPanGestureEventPass.h"

@implementation UIScrollView (AllowPanGestureEventPass)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer
         isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
            return YES;
        } else {
            return NO;
        }
}
@end
