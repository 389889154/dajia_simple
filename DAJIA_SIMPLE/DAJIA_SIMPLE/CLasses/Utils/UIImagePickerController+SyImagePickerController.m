//
//  UIImagePickerController+SyImagePickerController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UIImagePickerController+SyImagePickerController.h"

@implementation UIImagePickerController (SyImagePickerController)


- (BOOL)shouldAutorotate {
    return NO;
}
// 修改 相机再ios6 上调用崩溃 12.17
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
@end
