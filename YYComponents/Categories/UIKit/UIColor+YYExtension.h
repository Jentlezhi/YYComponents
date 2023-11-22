//
//  UIColor+YYExtension.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YYExtension)

/**
 随机颜色
 */
@property(nonatomic, strong, class, readonly) UIColor *yy_randomColor;
/**
 颜色16进制
 */
@property(nonatomic, copy, class, readonly) UIColor *(^yy_colorWithHex)(NSString *_Nullable hexColor);

@end

NS_ASSUME_NONNULL_END
