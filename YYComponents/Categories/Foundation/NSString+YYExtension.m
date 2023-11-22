//
//  NSString+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import "NSString+YYExtension.h"

@implementation NSString (YYExtension)

+ (BOOL (^)(NSString * _Nullable))yy_isNotEmpty {
    return ^(NSString *text){
        return [self _isNotEmpty:text];
    };
}

+ (BOOL (^)(NSString * _Nullable))yy_isEmpty {
    return ^(NSString *text){
        return [self _isEmpty:text];
    };
}

+ (BOOL)_isEmpty:(NSString *)text {
    if(!text || text == nil || ![text isKindOfClass:[NSString class]]) return YES;
    if ([text isEqual:[NSNull null]]) {return YES;}
    if ([text isKindOfClass:[NSNull class]]) {return YES;}
    ///兼容强制转换为NSString的情况
    if ([text isEqualToString:@"(null)"]) {return YES;}
    if ([text isEqualToString:@"<null>"]) {return YES;}
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [text stringByTrimmingCharactersInSet:set];
    return trimmedStr.length == 0;
}
+ (BOOL)_isNotEmpty:(NSString *)text {
    return ![self _isEmpty:text];
}

+ (NSString * _Nonnull (^)(NSString * _Nullable, NSString * _Nonnull))yy_ifNilSetDefaultValue {
    return ^(NSString *text, NSString *defaultValue){
        if ([self _isNotEmpty:text]) {
            return text;
        }
        return defaultValue;
    };
}

+ (NSString * _Nonnull (^)(NSString * _Nullable))yy_avoidNil {
    return ^(NSString *text) {
        return NSString.yy_ifNilSetDefaultValue(text, @"");
    };
}


@end
