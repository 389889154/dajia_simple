//
//  RentCommonCellModel.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RentCommonCellModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) Class targetClass;

- (instancetype)initWithTitle:(NSString *)title imageName:(NSString *)imageName targetClass:(Class)targetClass;
@end
