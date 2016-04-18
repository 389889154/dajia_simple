//
//  RootViewController.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/3/31.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "RootViewController.h"
#import "MineViewController.h"
#import "MainViewController.h"
#import "DiscoverViewController.h"
#import "NotifacationViewController.h"
@interface RootViewController ()
@property (nonatomic, strong) NSArray *items;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = @[@[@"首页",@"发现",@"通知",@"我"],
                            @[@"",@"",@"",@""]];
    
    for (int i = 0; i<[self.items.firstObject count]; i++) {
        UIViewController *vc = [[UIViewController alloc]init];
        if (i==0) {
            vc = [[MainViewController alloc]init];
        }
        [self addChildViewController:vc :self.items.firstObject[i] :self.items.lastObject[i]];
    }
}

- (void)addChildViewController:(UIViewController *)childController :(NSString *)titile :(NSString *)img {
    
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:childController];
    childController.title = titile;
    childController.tabBarItem = [[UITabBarItem alloc] initWithTitle:titile image:SY_IMAGE(img) selectedImage:SY_IMAGE(img)];
    [self addChildViewController:nvc];

}



@end
