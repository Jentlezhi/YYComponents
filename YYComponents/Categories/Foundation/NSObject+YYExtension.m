//
//  NSObject+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//  Copyright © 2018 Jentle. All rights reserved.
//

#import "NSObject+YYExtension.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (YYExtension)

/**
 把模型中存在的所有值赋值给另一个model
 @param toModel      目标model
 */
- (void)yy_setAllPropertiesValueToModel:(nonnull id)toModel {
    if (toModel == nil) {return;}
    Class cls = [self class];
    if (![toModel isKindOfClass:cls]) {
        return;
    }
    unsigned int count = 0;
    //获取类的属性列表
    Ivar *ivars = class_copyIvarList(cls, &count);
    //给属性赋值
    for (int i = 0; i < count; i++){
        Ivar ivar = ivars[i];
        //获取变量名称
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //生成setter方法
        NSString *usefullStr = [key substringFromIndex:1];
        //跳过下划线
        SEL getSel = NSSelectorFromString(usefullStr);
        key = usefullStr.capitalizedString;
        //大写首字母
        key = [NSString stringWithFormat:@"set%@:", key];
        //拼接set方法字符串
        SEL setSel = NSSelectorFromString(key);
        //调用setter方法
        if ([toModel respondsToSelector:setSel]){
            if (getSel != nil && [self respondsToSelector:getSel]){
                _Pragma("clang diagnostic push")
                _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
                ((void (*)(id, SEL, NSString *))objc_msgSend)(toModel, setSel, [self performSelector:getSel]);
                _Pragma("clang diagnostic pop")
            }
        }
    }
    free(ivars);
}

@end
