//
//  NSObject+YYExtension.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//  Copyright © 2018 Jentle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YYExtension)

/**
 把模型中存在的所有值赋值给另一个model
 @param toModel      目标model
 */
- (void)yy_setAllPropertiesValueToModel:(nonnull id)toModel;

@end

NS_ASSUME_NONNULL_END
