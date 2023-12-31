//
//  UIView+YYExtension.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YYLayoutSubviewsDirection) {
    YYLayoutSubviewsHorizontal = 0,
    YYLayoutSubviewsVertical,
};

NS_ASSUME_NONNULL_BEGIN

@interface YYViewConfig : NSObject

@property(nonatomic, strong) UIColor *backgroundColor;

@property(nonatomic, assign) CGFloat cornerRaduis;

@property(nonatomic, assign) CGFloat borderWidth;

@property(nonatomic, strong) UIColor *borderColor;

@property(nonatomic, assign) BOOL hidden;

@end

@interface UIView (YYExtension)

/**
 快速创建view
 @param configBlock          配置描述
 @return                     view
 */
+ (instancetype)yy_viewWithConfig:(void(^)(YYViewConfig *config))configBlock;
/**
 添加点击事件
 @param tapBlock     点击动作
 */
- (void)yy_addTapAction:(void(^)(void))tapBlock;
/**
 布局子视图
 @param direction      布局方向
 @param itemNumber     数量
 @param itemEdgeInsets 间距
 @param itemSpacing    子视图间距
 @param itemBuild      创建子视图
 */
- (void)yy_addSubviewsWithDirection:(YYLayoutSubviewsDirection)direction
                         itemNumber:(NSInteger)itemNumber
                     itemEdgeInsets:(UIEdgeInsets)itemEdgeInsets
                        itemSpacing:(CGFloat)itemSpacing
                          itemBuild:(nonnull UIView* (^)(NSInteger index))itemBuild;

/**
 类名标识符
 */
@property(nonatomic, strong, class, readonly) NSString *yy_classIdentifier;

@end

NS_ASSUME_NONNULL_END
