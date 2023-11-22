//
//  UILabel+YYExtension.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYLabelConfig : NSObject

@property(nonatomic, strong) UIColor *textColor;

@property(nonatomic, strong) UIColor *backgroundColor;

@property(nonatomic, assign) NSTextAlignment textAlignment;

@property(nonatomic, strong) UIFont *font;

@property(nonatomic, copy) NSString *text;

@property(nonatomic, assign) NSInteger numberOfLines;

@property(nonatomic, assign) UILayoutPriority horizontalHuggingPriority;

@property(nonatomic, assign) UILayoutPriority horizontalCompressionResistancePriority;

@property(nonatomic, assign) BOOL hidden;

@end

@interface UILabel (YYExtension)

/**
 快速创建label
 @param configBlock   配置描述
 @return              label
 */
+ (instancetype)yy_labelWithConfig:(void(^)(YYLabelConfig *config))configBlock;

@end

NS_ASSUME_NONNULL_END
