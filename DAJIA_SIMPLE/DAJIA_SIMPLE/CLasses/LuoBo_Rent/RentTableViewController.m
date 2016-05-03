//
//  RentTableViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "RentTableViewController.h"
#import "RentCommonCell.h"
@interface RentTableViewController ()

@end

@implementation RentTableViewController



- (instancetype)init {
    
    if (self = [super init]) {
        _sectionNumber = 1;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc]init];
}


- (void)setDataArray:(NSMutableArray *)dataArray {
    
    _dataArray = dataArray;
#pragma mark --- 这里效率 有问题
     [self.tableView registerClass:self.cellClass forCellReuseIdentifier:[self.cellClass description]];
    NSAssert(self.cellClass, @"先注册 Cell Class");

    ///  刷新
    [self.tableView reloadData];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.sectionNumber == 1) ? self.dataArray.count : [self.dataArray[section] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
#pragma mark --- 这里Cell类型需要强转
   RentBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:[self.cellClass description]];
    if (!cell) {
        
        cell = [[self.cellClass alloc]init];
    }
    if (self.sectionNumber == 1) {
        cell.model = self.dataArray [indexPath.row];
    } else if (self.sectionNumber >1) {
        cell.model = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    }
    return cell;
    
}

// section 高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20.f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return (section == self.dataArray.count -1) ? 10 : 0;
}

#pragma mark --- 自定义分割线
- (void) tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 5, 0, 5);
    
    // 三个方法并用，实现自定义分割线效果
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = insets;
    }
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:insets];
    }
    
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSAssert(self.nextClass, @"nextVC is nil");
    NSLog(@"%ld",self.navigationController.viewControllers.count);
    if (self.navigationController.viewControllers.count) {
        [self showViewController:[[self.nextClass alloc]init] sender:nil];
    }else {
        [self presentViewController:[[self.class alloc]init] animated:YES completion:nil];
    }
}


@end
