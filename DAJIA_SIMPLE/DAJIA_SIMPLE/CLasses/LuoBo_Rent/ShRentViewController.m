//
//  ShRentViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/28.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "ShRentViewController.h"
#import "ShBaseTableView.h"
#import "ShRentHeaderView.h"
#import "RentHelper.h"
#import "FooViewController.h"
#import "RentCustomerController.h"
@interface ShRentViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *imageBtnModels;
@property (nonatomic, strong) ShRentHeaderView *headerView;
@end

@implementation ShRentViewController

-(ShRentHeaderView *)headerView {
    if (!_headerView) {
    _headerView =  [[ShRentHeaderView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenWidth/4)];

    }
    return _headerView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpData];
    [self setUpView];
    
}

- (void)setUpView {
    ImageBtnModel *m1 = [[ImageBtnModel alloc]initWithTitle:@"房屋信息" imageName:@"RentPlaceHolder" targetClass:[FooViewController class]];
     ImageBtnModel *m2 = [[ImageBtnModel alloc]initWithTitle:@"客户信息" imageName:@"RentPlaceHolder" targetClass:[RentCustomerController class]];
     ImageBtnModel *m3 = [[ImageBtnModel alloc]initWithTitle:@"订 单" imageName:@"RentPlaceHolder" targetClass:[FooViewController class]];
     ImageBtnModel *m4 = [[ImageBtnModel alloc]initWithTitle:@"支付单" imageName:@"RentPlaceHolder" targetClass:[FooViewController class]];
    self.imageBtnModels = @[m1,m2,m3,m4];
    self.headerView.btnModels = self.imageBtnModels;
    [self.view addSubview:self.headerView];
    __weak typeof(self) weakSelf = self;
    self.headerView.clickedBLock = ^(NSInteger index){
        ImageBtnModel *model = weakSelf.imageBtnModels[index];
        UIViewController *vc = [[model.targetClass alloc]init];
        vc.title = model.title;
        // tabbar 在tabbar 处理
        [vc setHidesBottomBarWhenPushed:YES];
        [weakSelf showViewController:vc sender:nil];

    };
}

- (void)setUpData {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
