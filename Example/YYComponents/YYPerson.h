//
//  YYPerson.h
//  YYComponents_Example
//
//  Created by Jentle-Zhi on 2023/11/21.
//  Copyright © 2023 Jentle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYPerson : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, assign) NSInteger age;
//
@property(nonatomic, assign) CGFloat height;


@end

NS_ASSUME_NONNULL_END
