//
//  UIImage+SyImage.m
//  DAJIA_SIMPLE
//
//  Created by wey on 16/4/19.
//  Copyright © 2016年 weiSH. All rights reserved.
//

#import "UIImage+SyImage.h"
#import <CoreText/CoreText.h>
#import "SyFileManager.h"
@implementation UIImage (SyImage)

+ (UIImage *)imageWithText:(NSString *)text
                   andFont:(UIFont *)font
                  andColor:(UIColor *)color {
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    size.width += 2;
    size.height += 2;
    
    if (&UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //阴影
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [color
    // CGColor]);
    const CGFloat *comp = CGColorGetComponents([color CGColor]);
    CGContextSetRGBFillColor(ctx, comp[0], comp[1], comp[2], comp[3]);
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:font,
                         NSFontAttributeName, nil];
    [text drawAtPoint:CGPointMake(0.0, 0.0) withAttributes:dic];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color andSize:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);  // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)combImageWithLeft:(NSString *)lImgStr
                        middle:(NSString *)mImgStr
                         right:(NSString *)rImgStr
                          size:(CGSize)size {
    UIImage *lImg = [UIImage imageNamed:lImgStr];
    UIImage *cImg = [UIImage imageNamed:mImgStr];
    UIImage *rImg = [UIImage imageNamed:rImgStr];
    CGFloat h = size.height;
    CGFloat w = size.width;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [lImg drawInRect:CGRectMake(0, 0, lImg.size.width, h)];
    [cImg drawInRect:CGRectMake(lImg.size.width, 0,
                                w - lImg.size.width - rImg.size.width, h)];
    [rImg drawInRect:CGRectMake(w - rImg.size.width, 0, rImg.size.width, h)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

+ (UIImage *)combImageWithTop:(NSString *)tImgStr
                       middle:(NSString *)mImgStr
                       bottom:(NSString *)bImgStr
                         size:(CGSize)size {
    UIImage *tImg = [UIImage imageNamed:tImgStr];
    UIImage *mImg = [UIImage imageNamed:mImgStr];
    UIImage *bImg = [UIImage imageNamed:bImgStr];
    CGFloat h = size.height;
    CGFloat w = size.width;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [tImg drawInRect:CGRectMake(0, 0, w, tImg.size.height)];
    [mImg drawInRect:CGRectMake(0, tImg.size.height, w,
                                h - tImg.size.height - bImg.size.height)];
    [bImg drawInRect:CGRectMake(0, h - bImg.size.height, w, bImg.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

+ (UIImage *)imageWithPersonID:(NSString *)personID sizeType:(NSInteger)type {
    NSString *imagePath =
    [SyFileManager faceImagePathWithUniqueId:personID sizeType:type];
    if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
        return [UIImage imageWithContentsOfFile:imagePath];
    } else {
        return nil;
    }
}

+ (UIImage *)orgChartWithCommunityID:(NSString *)communityID {
    NSString *path = [SyFileManager orgChartFilePathWithCommunityID:communityID];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return [UIImage imageWithContentsOfFile:path];
    } else {
        return nil;
    }
}

+ (UIImage *)strechImageWithName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    CGFloat top = image.size.height * 0.5f;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5f;
    CGFloat right = image.size.width * 0.5f;
    UIEdgeInsets insets = UIEdgeInsetsMake(top, bottom, left, right);
    return [image resizableImageWithCapInsets:insets];
}

- (UIImage *)fixOrientation {
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width,
                                                   self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the
    // transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(
                                             NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage), CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx,
                               CGRectMake(0, 0, self.size.height, self.size.width),
                               self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx,
                               CGRectMake(0, 0, self.size.width, self.size.height),
                               self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

+ (UIImage *)scaleImage:(UIImage *)image
                toScale:(float)scaleSize

{
    UIGraphicsBeginImageContext(
                                CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize,
                                 image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

+ (UIImage *)scaleImageForDajia:(UIImage *)image {
    if (image.size.width > 1800) {
        UIGraphicsBeginImageContext(
                                    CGSizeMake(1800, image.size.height * 1800.0 / image.size.width));
        [image drawInRect:CGRectMake(0, 0, 1800, image.size.height * 1800.0 /
                                     image.size.width)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    } else {
        return image;
    }
}

+ (UIImage *)scaleImageForQRReader:(UIImage *)image {
    CGFloat scale = image.size.width / image.size.height;
    if (image.size.width > 1024.0 && scale >= 1) {
        UIGraphicsBeginImageContext(
                                    CGSizeMake(1024.0, image.size.height * 1024.0 / image.size.width));
        [image drawInRect:CGRectMake(0, 0, 1024.0, image.size.height * 1800.0 /
                                     image.size.width)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    } else if (image.size.height > 1024.0) {
        UIGraphicsBeginImageContext(
                                    CGSizeMake(image.size.width * 1024.0 / image.size.height, 1024.0));
        [image drawInRect:CGRectMake(0, 0,
                                     image.size.width * 1800.0 / image.size.height,
                                     1024.0)];
        UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    } else {
        return image;
    }
}

- (UIImage *)getSubImage:(CGRect)rect {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef),
                                    CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CFRelease(subImageRef);
    return smallImage;
}

+ (UIImage *)addImage:(UIImage *)image toBgImage:(UIImage *)bgImage {
    UIGraphicsBeginImageContext(bgImage.size);
    
    [bgImage
     drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    [image drawInRect:CGRectMake((bgImage.size.width - image.size.width) / 2,
                                 (bgImage.size.height - image.size.height) / 2,
                                 image.size.width, image.size.height)];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

// 1.自动缩放到指定大小
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize {
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    } else {
        UIGraphicsBeginImageContext(asize);
        [image drawInRect:CGRectMake(0, 0, asize.width, asize.height)];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

// 2.保持原来的长宽比，生成一个缩略图
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image
                                       size:(CGSize)asize {
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    } else {
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width / asize.height > oldsize.width / oldsize.height) {
            rect.size.width = asize.height * oldsize.width / oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width) / 2;
            rect.origin.y = 0;
        } else {
            rect.size.width = asize.width;
            rect.size.height = asize.width * oldsize.height / oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height) / 2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));  // clear
        // background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

+ (UIImage *)makeImageFromString:(NSString *)string
                            font:(UIFont *)font
                           color:(UIColor *)color {
    CGRect rect = CGRectMake(0, -1, font.lineHeight, font.lineHeight + 2);
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    CGContextRef content = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(content, CGAffineTransformIdentity);
    CGAffineTransform flipVertical =
    CGAffineTransformMake(1, 0, 0, -1, 0, rect.size.height);
    CGContextConcatCTM(content, flipVertical);
    
    NSMutableParagraphStyle *paragraphStyle =
    [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes =
    @{NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle, NSForegroundColorAttributeName:color};
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString setAttributes:attributes range:NSMakeRange(0, attributedString.length)];
    
    CTFramesetterRef ctFramesetter = CTFramesetterCreateWithAttributedString(
                                                                             (CFMutableAttributedStringRef)attributedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);
    CTFrameRef ctFrame =
    CTFramesetterCreateFrame(ctFramesetter, CFRangeMake(0, attributedString.length), path, NULL);
    CTFrameDraw(ctFrame, content);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CFRelease(ctFramesetter);
    CFRelease(path);
    CFRelease(ctFrame);
    
    return image;
}


@end
