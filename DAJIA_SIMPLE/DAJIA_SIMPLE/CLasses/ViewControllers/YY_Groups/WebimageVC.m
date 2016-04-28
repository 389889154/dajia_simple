//
//  WebimageVC.m
//  YYKitTS
//
//  Created by wey on 16/4/26.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "WebimageVC.h"
#import "YYKit.h"
#import "WebImageTableViewCell.h"
#pragma mark --- ImageViewVC
@interface WebimageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *imageLinks;
@end

@implementation WebimageVC

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = ceil((kScreenWidth) * 3.0 / 4.0);
        _tableView.backgroundColor = [UIColor darkGrayColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
    [self.view addSubview:self.tableView];
    [self scrollViewDidScroll:self.tableView];
}

- (void)loadData {
    self.imageLinks = @[
                        /*
                         You can add your image url here.
                         */
                        
                        // progressive jpeg
                        @"https://s-media-cache-ak0.pinimg.com/1200x/2e/0c/c5/2e0cc5d86e7b7cd42af225c29f21c37f.jpg",
                        
                        // animated gif: http://cinemagraphs.com/
                        @"http://i.imgur.com/uoBwCLj.gif",
                        @"http://i.imgur.com/8KHKhxI.gif",
                        @"http://i.imgur.com/WXJaqof.gif",
                        
                        // animated gif: https://dribbble.com/markpear
                        @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1780193/dots18.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1809343/dots17.1.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1845612/dots22.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1820014/big-hero-6.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1819006/dots11.0.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/345826/screenshots/1799885/dots21.gif",
                        
                        // animaged gif: https://dribbble.com/jonadinges
                        @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/2025999/batman-beyond-the-rain.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1855350/r_nin.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1963497/way-back-home.gif",
                        @"https://d13yacurqjgara.cloudfront.net/users/288987/screenshots/1913272/depressed-slurp-cycle.gif",
                        
                        // jpg: https://dribbble.com/snootyfox
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2047158/beerhenge.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2016158/avalanche.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1839353/pilsner.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1833469/porter.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1521183/farmers.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1391053/tents.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1399501/imperial_beer.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1488711/fishin.jpg",
                        @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1466318/getaway.jpg",
                        
                        // animated webp and apng: http://littlesvr.ca/apng/gif_apng_webp.html
                        @"http://littlesvr.ca/apng/images/BladeRunner.png",
                        @"http://littlesvr.ca/apng/images/Contact.webp",
                        
                        ];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(reload)];
    [self.tableView reloadData]; // 这里刷新一下防止,cell重合
    self.navigationItem.rightBarButtonItem = button;
}

// 重新下载
- (void)reload {
    [[YYImageCache sharedCache].memoryCache removeAllObjects];
    [[YYImageCache sharedCache].diskCache removeAllObjectsWithBlock:^{}];
    [self.tableView performSelector:@selector(reloadData) afterDelay:0.1];
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    if (kiOS7Later) {
//        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    }
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    if (kiOS7Later) {
//        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//        self.navigationController.navigationBar.tintColor = nil;
//    }
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//}


#pragma mark --- UITableView Delegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageLinks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath {
    
    WebImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"webCell"];
    if (!cell) {
        cell = [[WebImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"webCell"];
    }
   [ cell setImageURL:[NSURL URLWithString:self.imageLinks[indexPath.row]]];
    return cell;
}

#pragma mark --- ScrollView Delegate //cell变形

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat viewHeight = scrollView.height + scrollView.contentInset.top;
    for (WebImageTableViewCell *cell in [self.tableView visibleCells]) {
        CGFloat y = cell.centerY - scrollView.contentOffset.y;
        CGFloat p = y - viewHeight / 2;
        CGFloat scale = cos(p / viewHeight * 0.8) * 0.95;
        if (kiOS8Later) {
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
                cell.webImageView.transform = CGAffineTransformMakeScale(scale, scale);
            } completion:NULL];
        } else {
            cell.webImageView.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }

}

@end
