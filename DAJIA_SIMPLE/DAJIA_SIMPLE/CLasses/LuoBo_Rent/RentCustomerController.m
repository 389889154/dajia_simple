//
//  RentCustomerController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "RentCustomerController.h"
#import "RentCommonCell.h"
#import "FooViewController.h"
@interface RentCustomerController ()

@end

@implementation RentCustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellClass = [RentBaseCell class];
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i<63; i++) {
        [arrM addObject:@"北京萝卜互联网产业投资有限公司"];
    }
    self.dataArray = arrM;
    self.nextClass = [FooViewController class];
    self.sectionNumber = 1;

}




@end
