//
//  UIImageView+YYExtension.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YYExtension)

/**
 根据颜色生成图片
 @param color      色值
 @return           图片
 */
+ (instancetype)yy_imageWithColor:(UIColor *)color;

/**
 根据颜色生成图片
 @param color      色值
 @param size       图片size
 @return           图片
 */
+ (instancetype)yy_imageWithColor:(UIColor *)color
                        imageSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
