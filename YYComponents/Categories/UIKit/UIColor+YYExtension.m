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
    CGFloat a = MAX(arc4random_uniform(256), 0.3);
    return [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a];
}

+ (UIColor * _Nonnull (^)(NSString * _Nonnull))yy_colorWithHex {
    return ^(NSString *hexValue) {
        if ([hexValue length] < 6){//长度不合法
            return UIColor.blackColor;
        }
        NSString *colorString = [[hexValue stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
        CGFloat alpha, red, blue, green;
        switch ([colorString length]) {
            case 3: // #RGB
                alpha = 1.0f;
                red   = [self _colorComponentFrom: colorString start: 0 length: 1];
                green = [self _colorComponentFrom: colorString start: 1 length: 1];
                blue  = [self _colorComponentFrom: colorString start: 2 length: 1];
                break;
            case 4: // #ARGB
                alpha = [self _colorComponentFrom: colorString start: 0 length: 1];
                red   = [self _colorComponentFrom: colorString start: 1 length: 1];
                green = [self _colorComponentFrom: colorString start: 2 length: 1];
                blue  = [self _colorComponentFrom: colorString start: 3 length: 1];
                break;
            case 6: // #RRGGBB
                alpha = 1.0f;
                red   = [self _colorComponentFrom: colorString start: 0 length: 2];
                green = [self _colorComponentFrom: colorString start: 2 length: 2];
                blue  = [self _colorComponentFrom: colorString start: 4 length: 2];
                break;
            case 8: // #AARRGGBB
                alpha = [self _colorComponentFrom: colorString start: 0 length: 2];
                red   = [self _colorComponentFrom: colorString start: 2 length: 2];
                green = [self _colorComponentFrom: colorString start: 4 length: 2];
                blue  = [self _colorComponentFrom: colorString start: 6 length: 2];
                break;
            default:
                blue=0;
                green=0;
                red=0;
                alpha=0;
                break;
        }
        return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    };
}
+ (CGFloat)_colorComponentFrom:(NSString *)string
                        start:(NSUInteger)start
                       length:(NSUInteger)length {
    unsigned hexComponent;
    @try{
        NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
        NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
        
        [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    }
    @catch(NSException *exception){}
    @finally{}
    return hexComponent / 255.0;
}

@end
