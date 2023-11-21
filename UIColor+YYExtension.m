//
//  UIColor+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import "UIColor+YYExtension.h"



@implementation UIColor (YYExtension)

@dynamic yy_randomColor;

+ (UIColor *)yy_randomColor {
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    CGFloat a = arc4random_uniform(256);
    return [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0];
}

@end
