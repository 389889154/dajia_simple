//
//  ShRentHeaderView.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "ShRentHeaderView.h"
#import "ShImageBtn.h"
@implementation ShRentHeaderView

// 设置
- (void)setBtnModels:(NSArray *)btnModels {
    
    _btnModels = btnModels;
    [btnModels enumerateObjectsUsingBlock:^(ImageBtnModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ShImageBtn *btn = [[ShImageBtn alloc]init];
        btn.tag = idx;
        btn.title = obj.title;
        btn.imageName = obj.imageName;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }];
}

- (void)btnClicked:(ShImageBtn *)sender{
    if (self.clickedBLock) self.clickedBLock(sender.tag);
}

// 布局 更精确
- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.subviews.count) return;
    CGFloat w = self.frame.size.width/self.subviews.count;
    CGFloat h = self.frame.size.height;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(idx * w, 0, w, h);
    }];
}

@end

@implementation ImageBtnModel

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass {
    if (self = [super init]) {
        self.title = title;
        self.imageName = imageName;
        self.targetClass = targetClass;
    }
    return self;
}

@end
