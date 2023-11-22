//
//  UIView+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import "UIView+YYExtension.h"
#import <objc/runtime.h>

const char *YYTAPACTIONKEY = "YYTAPACTIONKEY";

@implementation UIView (YYExtension)

/**
 添加点击事件
 @param tapBlock     点击动作
 */
- (void)yy_addTapAction:(void(^)(void))tapBlock {
    if (tapBlock == nil) {return;}
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_yy_tapAction)];
    objc_setAssociatedObject(self, YYTAPACTIONKEY, tapBlock, OBJC_ASSOCIATION_COPY);
    [self addGestureRecognizer:tap];
}

- (void)_yy_tapAction {
    void(^tapBlock)(void) = objc_getAssociatedObject(self, YYTAPACTIONKEY);
    if (tapBlock) {
        tapBlock();
    }
}

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
                          itemBuild:(nonnull UIView * (^)(NSInteger index))itemBuild {
    ///构建子视图为nil，直接返回
    if (itemBuild == nil){return;}
    UIView *fatherView = self;
    ///先移除旧视图
    if (fatherView.subviews.count > 0){
        [fatherView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    ///间距
    CGFloat leftSpacing = itemEdgeInsets.left;
    CGFloat rightSpacing = itemEdgeInsets.right;
    CGFloat topSpacing = itemEdgeInsets.top;
    CGFloat bottomSpacing = itemEdgeInsets.bottom;
    BOOL horizontal = (direction == YYLayoutSubviewsHorizontal);
    ///添加新的视图
    for (NSInteger index = 0; index < itemNumber; index ++) {
        UIView *itemView = itemBuild(index);
        ///取前一个视图
        UIView *preItemView = nil;
        if (index >= 1 && index <= itemNumber - 1) {
            preItemView = [fatherView.subviews objectAtIndex:index - 1];
        }
        itemView.translatesAutoresizingMaskIntoConstraints = NO;
        [fatherView addSubview:itemView];
        if (horizontal){
            UIView *leftToItem = preItemView == nil ? fatherView : preItemView;
            CGFloat leftSpace = preItemView == nil ? leftSpacing : itemSpacing;
            NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:leftToItem attribute:NSLayoutAttributeLeft multiplier:1.0 constant:leftSpace];
            [fatherView addConstraint:leftConstraint];
            
            NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeTop multiplier:1.0 constant:topSpacing];
            [fatherView addConstraint:topConstraint];
            
            NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-bottomSpacing];
            [fatherView addConstraint:bottomConstraint];
            
            if (index == (itemNumber - 1)) {
                NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-rightSpacing];
                [fatherView addConstraint:rightConstraint];
            }
        }else{///纵向
            UIView *topToItem = preItemView == nil ? fatherView : preItemView;
            CGFloat topSpace = preItemView == nil ? topSpacing : itemSpacing;
            NSLayoutAttribute topLayoutAttribute = preItemView == nil ? NSLayoutAttributeTop : NSLayoutAttributeBottom;
            NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:topToItem attribute:topLayoutAttribute multiplier:1.0 constant:topSpace];
            [fatherView addConstraint:topConstraint];
            
            NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:leftSpacing];
            [fatherView addConstraint:leftConstraint];
            
            NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-rightSpacing];
            [fatherView addConstraint:rightConstraint];
            
            if (index == (itemNumber - 1)) {
                NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:itemView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-bottomSpacing];
                [fatherView addConstraint:bottomConstraint];
            }
        }
    }
}

+ (NSString *)yy_classIdentifier {
    return NSStringFromClass([self class]);;
}

@end
