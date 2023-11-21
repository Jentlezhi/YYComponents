//
//  YYScrollViewDataSet.h
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/08/16.
//  Copyright © 2018 Github. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YYEmptyDataSetSource;
@protocol YYEmptyDataSetDelegate;

#define YYEmptyDataSetDeprecated(instead) DEPRECATED_MSG_ATTRIBUTE(" Use " # instead " instead")

/**
 The object that acts as the data source of the empty datasets.
 @discussion The data source must adopt the YYEmptyDataSetSource protocol. The data source is not retained. All data source methods are optional.
 */
@protocol YYEmptyDataSetSource <NSObject>
@optional

/**
 Asks the data source for the title of the dataset.
 The dataset uses a fixed font style by default, if no attributes are set. If you want a different font style, return a attributed string.
 
 @param scrollView A scrollView subclass informing the data source.
 @return An attributed string for the dataset title, combining font, text color, text pararaph style, etc.
 */
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;

/**
 Asks the data source for the description of the dataset.
 The dataset uses a fixed font style by default, if no attributes are set. If you want a different font style, return a attributed string.
 
 @param scrollView A scrollView subclass informing the data source.
 @return An attributed string for the dataset description text, combining font, text color, text pararaph style, etc.
 */
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView;

/**
 Asks the data source for the image of the dataset.
 
 @param scrollView A scrollView subclass informing the data source.
 @return An image for the dataset.
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView;


/**
 Asks the data source for a tint color of the image dataset. Default is nil.
 
 @param scrollView A scrollView subclass object informing the data source.
 @return A color to tint the image of the dataset.
 */
- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView;

/**
 *  Asks the data source for the image animation of the dataset.
 *
 *  @param scrollView A scrollView subclass object informing the delegate.
 *
 *  @return image animation
 */
- (CAAnimation *) imageAnimationForEmptyDataSet:(UIScrollView *) scrollView;

/**
 Asks the data source for the title to be used for the specified button state.
 The dataset uses a fixed font style by default, if no attributes are set. If you want a different font style, return a attributed string.
 
 @param scrollView A scrollView subclass object informing the data source.
 @param state The state that uses the specified title. The possible values are described in UIControlState.
 @return An attributed string for the dataset button title, combining font, text color, text pararaph style, etc.
 */
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;

/**
 Asks the data source for the image to be used for the specified button state.
 This method will override buttonTitleForEmptyDataSet:forState: and present the image only without any text.
 
 @param scrollView A scrollView subclass object informing the data source.
 @param state The state that uses the specified title. The possible values are described in UIControlState.
 @return An image for the dataset button imageview.
 */
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;

/**
 Asks the data source for a background image to be used for the specified button state.
 There is no default style for this call.
 
 @param scrollView A scrollView subclass informing the data source.
 @param state The state that uses the specified image. The values are described in UIControlState.
 @return An attributed string for the dataset button title, combining font, text color, text pararaph style, etc.
 */
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;

/**
 Asks the data source for the background color of the dataset. Default is clear color.
 
 @param scrollView A scrollView subclass object informing the data source.
 @return A color to be applied to the dataset background view.
 */
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView;

/**
 Asks the data source for a custom view to be displayed instead of the default views such as labels, imageview and button. Default is nil.
 Use this method to show an activity view indicator for loading feedback, or for complete custom empty data set.
 Returning a custom view will ignore -offsetForEmptyDataSet and -spaceHeightForEmptyDataSet configurations.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return The custom view.
 */
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView;

/**
 Asks the data source for a offset for vertical and horizontal alignment of the content. Default is CGPointZero.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return The offset for vertical and horizontal alignment.
 */
- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView YYEmptyDataSetDeprecated(-verticalOffsetForEmptyDataSet:);
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView;

/**
 Asks the data source for a vertical space between elements. Default is 11 pts.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return The space height between elements.
 */
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView;

@end


/**
 The object that acts as the delegate of the empty datasets.
 @discussion The delegate can adopt the YYEmptyDataSetDelegate protocol. The delegate is not retained. All delegate methods are optional.
 
 @discussion All delegate methods are optional. Use this delegate for receiving action callbacks.
 */
@protocol YYEmptyDataSetDelegate <NSObject>
@optional

/**
 Asks the delegate to know if the empty dataset should fade in when displayed. Default is YES.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return YES if the empty dataset should fade in.
 */
- (BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView;

/**
 Asks the delegate to know if the empty dataset should still be displayed when the amount of items is more than 0. Default is NO
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return YES if empty dataset should be forced to display
 */
- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView;

/**
 Asks the delegate to know if the empty dataset should be rendered and displayed. Default is YES.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return YES if the empty dataset should show.
 */
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView;

/**
 Asks the delegate for touch permission. Default is YES.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return YES if the empty dataset receives touch gestures.
 */
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView;

/**
 Asks the delegate for scroll permission. Default is NO.
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return YES if the empty dataset is allowed to be scrollable.
 */
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView;

/**
 Asks the delegate for image view animation permission. Default is NO.
 Make sure to return a valid CAAnimation object from imageAnimationForEmptyDataSet:
 
 @param scrollView A scrollView subclass object informing the delegate.
 @return YES if the empty dataset is allowed to animate
 */
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView;

/**
 Tells the delegate that the empty dataset view was tapped.
 Use this method either to resignFirstResponder of a textfield or searchBar.
 
 @param scrollView A scrollView subclass informing the delegate.
 */
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView YYEmptyDataSetDeprecated(-emptyDataSet:didTapView:);

/**
 Tells the delegate that the action button was tapped.
 
 @param scrollView A scrollView subclass informing the delegate.
 */
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView YYEmptyDataSetDeprecated(-emptyDataSet:didTapButton:);

/**
 Tells the delegate that the empty dataset view was tapped.
 Use this method either to resignFirstResponder of a textfield or searchBar.
 
 @param scrollView A scrollView subclass informing the delegate.
 @param view the view tapped by the user
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view;

/**
 Tells the delegate that the action button was tapped.
 
 @param scrollView A scrollView subclass informing the delegate.
 @param button the button tapped by the user
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button;

/**
 Tells the delegate that the empty data set will appear.

 @param scrollView A scrollView subclass informing the delegate.
 */
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView;

/**
 Tells the delegate that the empty data set did appear.

 @param scrollView A scrollView subclass informing the delegate.
 */
- (void)emptyDataSetDidAppear:(UIScrollView *)scrollView;

/**
 Tells the delegate that the empty data set will disappear.

 @param scrollView A scrollView subclass informing the delegate.
 */
- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView;

/**
 Tells the delegate that the empty data set did disappear.

 @param scrollView A scrollView subclass informing the delegate.
 */
- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView;

@end

#undef YYEmptyDataSetDeprecated

//配置文件
@interface YYScrollViewDataSetConfig : NSObject
//默认配置
+ (instancetype)defaultConfig;

/// 中心偏移量[默认：0.f，正值向下，负值向上]
@property(nonatomic, assign) CGFloat centerVOffset;
/// 是否响应手势[默认：YES]
@property(nonatomic, assign) BOOL allowTouch;
/// 是否可滚动[默认：YES]
@property(nonatomic, assign) BOOL allowScroll;
/// 动画时间[默认：0.25s，解决下拉刷新动画突兀]
@property(nonatomic, assign) NSTimeInterval animationDuration;
/// 内容最大宽度[默认：Window.width - 30.f]
@property(nonatomic, assign) CGFloat maxWidth;

@end

@interface YYScrollViewDataSet : NSObject<YYEmptyDataSetSource,YYEmptyDataSetDelegate>
//配置文件
@property(nonatomic, strong) YYScrollViewDataSetConfig *config;
//空视图
@property(nonatomic, strong) UIView *emptyView;
//错误视图
@property(nonatomic, strong) UIView *errorView;
//点击回调[重新set会覆盖上次的实现]
@property(nonatomic, copy) void(^tapBlock)(void);

/**
 默认初始化方法
 */
+ (instancetype)defaultDataSet;
/**
 初始化DataSet
 @param emptyViewBlock    创建空视图的block
 @return DataSet
 */
+ (instancetype)dataSetWithEmptyView:(UIView * _Nullable  (^__nonnull)(void))emptyViewBlock;
/**
 初始化DataSet
 @param emptyViewBlock    创建空视图的block
 @param tapBlock          点击空白回调的block
 @return DataSet
 */
+ (instancetype)dataSetWithEmptyView:(UIView * _Nullable  (^__nonnull)(void))emptyViewBlock
                                 tap:(void(^__nullable)(void))tapBlock;

/**
 初始化DataSet
 @param emptyViewBlock    创建空视图的block
 @param errorViewBlock    创建错误视图的block
 @return DataSet
 */
+ (instancetype)dataSetWithEmptyView:(UIView * _Nullable  (^__nullable)(void))emptyViewBlock
                           errorView:(UIView * _Nullable (^__nullable)(void))errorViewBlock;
/**
 初始化DataSet
 @param emptyViewBlock    创建空视图的block
 @param errorViewBlock    创建错误视图的block
 @param tapBlock          点击空白回调的block
 @return DataSet
 */
+ (instancetype)dataSetWithEmptyView:(UIView * _Nullable  (^__nullable)(void))emptyViewBlock
                            errorView:(UIView * _Nullable (^__nullable)(void))errorViewBlock
                                 tap:(void(^__nullable)(void))tapBlock;

/**
 初始化DataSet
 @param emptyViewBlock    创建空视图的block
 @param errorViewBlock    创建错误视图的block
 @param configBlock       设置配置内容的block
 @return DataSet
 */
+ (instancetype)dataSetWithEmptyView:(UIView * _Nullable  (^__nullable)(void))emptyViewBlock
                            errorView:(UIView * _Nullable (^__nullable)(void))errorViewBlock
                               config:(void (^__nullable)(YYScrollViewDataSetConfig *config))configBlock;
/**
 初始化DataSet
 @param emptyViewBlock    创建空视图的block
 @param errorViewBlock    创建错误视图的block
 @param configBlock       设置配置内容的block
 @param tapBlock          点击空白响应事件的block
 @return DataSet
 */
+ (instancetype)dataSetWithEmptyView:(UIView * _Nullable  (^__nullable)(void))emptyViewBlock
                            errorView:(UIView * _Nullable (^__nullable)(void))errorViewBlock
                              config:(void (^__nullable)(YYScrollViewDataSetConfig *config))configBlock
                                 tap:(void(^__nullable)(void))tapBlock;

@end

@interface UIScrollView (ScrollViewDataSet)

//类型
typedef NS_ENUM(NSUInteger, YYScrollViewDataSetType) {
    //空页面
    YYScrollViewDataSetTypeEmpty,
    //网络错误页面
    YYScrollViewDataSetTypeError,
    //不显示
    YYScrollViewDataSetTypeHidden
};

@property(nonatomic, strong, nonnull) YYScrollViewDataSet *dataSet;
@property(nonatomic, assign) YYScrollViewDataSetType dataSetType;

@end

NS_ASSUME_NONNULL_END
