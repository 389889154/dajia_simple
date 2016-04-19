//
//  UIImage+SyImage.h
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SyImage)


+ (UIImage *)imageWithText:(NSString *)text
                   andFont:(UIFont *)font
                  andColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
+ (UIImage *)combImageWithLeft:(NSString *)lImgStr
                        middle:(NSString *)mImgStr
                         right:(NSString *)rImgStr
                          size:(CGSize)size;
+ (UIImage *)combImageWithTop:(NSString *)tImgStr
                       middle:(NSString *)mImgStr
                       bottom:(NSString *)bImgStr
                         size:(CGSize)size;
+ (UIImage *)imageWithPersonID:(NSString *)personID sizeType:(NSInteger)type;

+ (UIImage *)orgChartWithCommunityID:(NSString *)communityID;
+ (UIImage *)strechImageWithName:(NSString *)name;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

// 图片矫正
- (UIImage *)fixOrientation;

/**
 *  图片压缩
 *  规则是图片宽度超过1800的会压缩到宽度1800
 *
 *  @param image
 *
 *  @return
 */
+ (UIImage *)scaleImageForDajia:(UIImage *)image;

/**
 *  二维码识别图片压缩
 *  规则是图片宽度或高度超过1024的会压缩到响应1024
 *
 *  @param image
 *
 *  @return
 */
+ (UIImage *)scaleImageForQRReader:(UIImage *)image;

/**
 *  裁剪图片
 *
 *  @param rect 置顶裁剪的区域
 *
 *  @return
 */
- (UIImage *)getSubImage:(CGRect)rect;

/**
 *  两张图片合成一张图片
 *
 *  @param image
 *  @param bgImage
 *
 *  @return
 */
+ (UIImage *)addImage:(UIImage *)image toBgImage:(UIImage *)bgImage;

/**
 *  微信分享等使用，自动缩放到指定大小
 *
 *  @param image
 *  @param asize
 *
 *  @return
 */
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize;

/**
 *  微信分享等使用，保持原来的长宽比，生成一个缩略图
 *
 *  @param image
 *  @param asize
 *
 *  @return
 */
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

/*
 * 通过字符串字体和颜色生成一个图片
 */
+ (UIImage *)makeImageFromString:(NSString *)string
                            font:(UIFont *)font
                           color:(UIColor *)color;



@end
