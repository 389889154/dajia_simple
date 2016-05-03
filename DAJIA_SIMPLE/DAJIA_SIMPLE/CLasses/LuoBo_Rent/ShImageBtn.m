//
//  ShImageBtn.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "ShImageBtn.h"

@implementation ShImageBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.layer.borderColor =[UIColor redColor].CGColor;
        self.layer.borderWidth = 1.f;   
        
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat x = contentRect.size.width * 0.2;
    CGFloat y = contentRect.size.height * 0.2;
    CGFloat w = contentRect.size.width - x*2;
    CGFloat h = contentRect.size.height/2;
    return CGRectMake(x, y, w, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, contentRect.size.height*0.7, contentRect.size.width, contentRect.size.height*0.3);
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}


@end
