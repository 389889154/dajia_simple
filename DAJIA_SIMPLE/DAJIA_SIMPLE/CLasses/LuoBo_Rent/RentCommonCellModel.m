//
//  RentCommonCellModel.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "RentCommonCellModel.h"

@implementation RentCommonCellModel
- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass {
    
    if (self = [super init]) {
        self.title = title;
        self.imageName = imageName;
        self.targetClass = targetClass;
    }
    return self;
}
@end
