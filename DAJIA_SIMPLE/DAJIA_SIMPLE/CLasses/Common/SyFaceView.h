//
//  SyFaceView.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "SyBaseControl.h"

@interface SyFaceView : SyBaseControl
{
    UIImageView     *_imageView;
}

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, copy) NSString    *faceID;
@end
