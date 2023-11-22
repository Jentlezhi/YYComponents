//
//  UIButton+YYExtension.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYButtonConfig : NSObject

@property(nonatomic, copy) NSString *normalTitle;

@property(nonatomic, copy) NSString *highlightedTitle;

@property(nonatomic, strong) UIFont *normalTitleColor;

@property(nonatomic, strong) UIFont *highlightedTitleColor;

@property(nonatomic, strong) UIFont *titleLabelFont;

@property(nonatomic, strong) UIColor *disabledBackgroundColor;

@property(nonatomic, assign) CGFloat cornerRaduis;

@property(nonatomic, assign) CGFloat borderWidth;

@property(nonatomic, strong) UIColor *borderColor;

@property(nonatomic, assign) BOOL hidden;

@end

@interface UIButton (YYExtension)

/// 点击事件block
@property(nonatomic, copy) void(^touchUpInsideAction)(void);
/**
 快速创建button
 @param configBlock          配置描述
 @return                     button
 */
+ (instancetype)yy_buttonWithConfig:(void(^)(YYButtonConfig *config))configBlock;
/**
 快速创建button
 @param configBlock          配置描述
 @param touchUpInsideBlock   响应事件
 @return                     button
 */
+ (instancetype)yy_buttonWithConfig:(void(^)(YYButtonConfig *config))configBlock
                      touchUpInside:(nullable void(^)(void))touchUpInsideBlock;

@end

NS_ASSUME_NONNULL_END
