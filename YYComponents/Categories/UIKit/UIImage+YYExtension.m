//
//  UIImageView+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import "UIImage+YYExtension.h"

@implementation UIImage (YYExtension)

/**
 根据颜色生成图片
 @param color      色值
 @return           图片
 */
+ (instancetype)yy_imageWithColor:(UIColor *)color {
    return [self yy_imageWithColor:color imageSize:CGSizeMake(1.f, 1.f)];
}

/**
 根据颜色生成图片
 @param color      色值
 @param size       图片size
 @return           图片
 */
+ (instancetype)yy_imageWithColor:(UIColor *)color
                        imageSize:(CGSize)size {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
