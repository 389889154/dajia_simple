//
//  RentTableViewController.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RentTableViewController : UITableViewController
@property (nonatomic, assign) NSInteger sectionNumber;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) Class cellClass;
@property (nonatomic, copy) Class nextClass;

@end
