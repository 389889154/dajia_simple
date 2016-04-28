//
//  WebImageTableViewCell.h
//  YYKitTS
//
//  Created by wey on 16/4/26.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYAnimatedImageView;
@interface WebImageTableViewCell : UITableViewCell
@property (nonatomic, strong) YYAnimatedImageView *webImageView;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UILabel *label;

- (void)setImageURL:(NSURL *)url ;
@end
