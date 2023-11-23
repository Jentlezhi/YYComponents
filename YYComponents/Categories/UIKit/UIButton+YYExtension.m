//
//  UIButton+YYExtension.m
//  YYComponents
//
//  Created by Jentle-Zhi on 2018/06/08.
//

#import "UIButton+YYExtension.h"
#import "UIImage+YYExtension.h"
#import "UIColor+YYExtension.h"
#import <objc/runtime.h>


@implementation YYButtonConfig

- (instancetype)init {
    if (self = [super init]) {
        self.normalTitle = @"";
        self.highlightedTitle = @"";
        self.titleLabelFont = [UIFont systemFontOfSize:16.f];
        self.disabledBackgroundColor = UIColor.yy_colorWithHex(@"#FFD1A6");
    }
    return self;
}
- (NSString *)highlightedTitle {
    if ([YYButtonConfig _isEmpty:_highlightedTitle]) {
        return self.normalTitle;
    }
    return _highlightedTitle;
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

+ (NSString *)_avoidNil:(NSString *)text {
    if ([self _isEmpty:text]) {
        return @"";
    }
    return text;
}

@end


const char *YYTOUCHUPINSIDEACTIONKEY = "YYTOUCHUPINSIDEACTIONKEY";

@implementation UIButton (YYExtension)

+ (instancetype)yy_buttonWithConfig:(void(^)(YYButtonConfig *config))configBlock {
    return [self yy_buttonWithConfig:configBlock touchUpInside:nil];
}

+ (instancetype)yy_buttonWithConfig:(void(^)(YYButtonConfig *config))configBlock
                      touchUpInside:(nullable void(^)(void))touchUpInsideBlock {
    YYButtonConfig *config = [YYButtonConfig new];
    !configBlock?:configBlock(config);
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *normalTitle = [YYButtonConfig _avoidNil:config.normalTitle];
    NSString *highlightedTitle = [YYButtonConfig _avoidNil:config.highlightedTitle];
    [b setTitle:normalTitle forState:UIControlStateNormal];
    [b setTitle:highlightedTitle forState:UIControlStateHighlighted];
    [b setTitleColor:config.normalTitleColor forState:UIControlStateNormal];
    [b setTitleColor:config.highlightedTitleColor forState:UIControlStateHighlighted];
    b.titleLabel.font = config.titleLabelFont;
    [b setBackgroundImage:[UIImage yy_imageWithColor:config.disabledBackgroundColor] forState:UIControlStateDisabled];
    if (config.cornerRaduis > 0) {
        b.layer.cornerRadius = config.cornerRaduis;
        b.layer.masksToBounds = YES;
    }
    if (config.borderColor && config.borderWidth > 0) {
        b.layer.borderColor = config.borderColor.CGColor;
        b.layer.borderWidth = config.borderWidth;
    }
    b.hidden = config.hidden;
    b.touchUpInsideAction = touchUpInsideBlock;
    return b;
}

- (void)setTouchUpInsideAction:(void (^)(void))touchUpInsideAction {
    if (touchUpInsideAction) {
        objc_setAssociatedObject(self, YYTOUCHUPINSIDEACTIONKEY, touchUpInsideAction, OBJC_ASSOCIATION_COPY);
        [self addTarget:self action:@selector(_yy_buttonTouchUpInsideAction) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void (^)(void))touchUpInsideAction {
    return objc_getAssociatedObject(self, YYTOUCHUPINSIDEACTIONKEY);
}

- (void)_yy_buttonTouchUpInsideAction {
    void(^tapBlock)(void) = self.touchUpInsideAction;
    if (tapBlock) {
        tapBlock();
    }
}



@end
