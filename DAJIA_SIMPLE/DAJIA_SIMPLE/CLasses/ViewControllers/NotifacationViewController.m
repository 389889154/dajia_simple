//
//  NotifacationViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/11.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "NotifacationViewController.h"
//#import "WebimageVC.h"
//#import "WBStatusTimelineViewController.h"
static NSString *const  cellID = @"imageCell";
@interface NotifacationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NotifacationViewController


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.titles = @[].mutableCopy;
//    self.classNames = @[].mutableCopy;
//    //    [self addCell:@"Animated Image" class:@"YYImageDisplayExample"];
//    //    [self addCell:@"Progressive Image" class:@"YYImageProgressiveExample"];
//    [self addCell:@"加载纯图片" class:@"WebimageVC"];
//    [self addCell:@"微博" class:@"WBStatusTimelineViewController"];
//    [self.view addSubview:self.tableView];
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
