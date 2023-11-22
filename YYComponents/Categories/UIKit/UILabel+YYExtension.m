//
//  UILabel+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import "UILabel+YYExtension.h"

@implementation YYLabelConfig

- (instancetype)init {
    if (self = [super init]) {
        self.textColor = UIColor.blackColor;
        self.backgroundColor = UIColor.whiteColor;
        self.textAlignment = NSTextAlignmentLeft;
        self.font = [UIFont systemFontOfSize:16.f];
        self.text = @"";
        self.numberOfLines = 1;
        self.horizontalHuggingPriority = UILayoutPriorityRequired;
        self.horizontalCompressionResistancePriority = UILayoutPriorityRequired;
        self.hidden = NO;
    }
    return self;
}

@end

@implementation UILabel (YYExtension)

+ (instancetype)yy_labelWithConfig:(void(^)(YYLabelConfig *config))configBlock {
    
    YYLabelConfig *config = [YYLabelConfig new];
    !configBlock?:configBlock(config);
    UILabel *l = UILabel.new;
    l.textColor = config.textColor;
    if (config.backgroundColor) {
        l.backgroundColor = config.backgroundColor;
    }
    l.textAlignment = config.textAlignment;
    l.font = config.font;
    if (config.text != nil) {
        l.text = config.text;
    }
    l.numberOfLines = config.numberOfLines;
    ///抗拉伸
    [l setContentHuggingPriority:config.horizontalHuggingPriority forAxis:UILayoutConstraintAxisHorizontal];
    ///抗压缩
    [l setContentCompressionResistancePriority:config.horizontalCompressionResistancePriority forAxis:UILayoutConstraintAxisHorizontal];
    l.hidden = config.hidden;
    [l sizeToFit];
    return l;
}

@end
