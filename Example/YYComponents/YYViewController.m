//
//  YYViewController.m
//  YYComponents
//
//  Created by Jentle on 11/21/2023.
//  Copyright (c) 2023 Jentle. All rights reserved.
//

#import "YYViewController.h"
#import "YYPerson.h"
#import "YYDataSetViewController.h"

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self dataSet];
}

- (void)dataSet {
    UIButton *btn = [UIButton yy_buttonWithConfig:^(YYButtonConfig * _Nonnull config) {
        config.normalTitle = @"点击跳转";
        config.normalTitleColor = UIColor.yy_randomColor;
    } touchUpInside:^{
        YYDataSetViewController *dataSetVC = [YYDataSetViewController new];
        [self.navigationController pushViewController:dataSetVC animated:YES];
    }];
    [btn sizeToFit];
    btn.center = self.view.center;
    [self.view addSubview:btn];
//    btn.touchUpInsideAction = ^{
//        YYDataSetViewController *dataSetVC = [YYDataSetViewController new];
//        [self.navigationController pushViewController:dataSetVC animated:YES];
//    };
//    UILabel *label = [UILabel new];
//    label.text = @"点击跳转";
//    label.textColor = UIColor.yy_randomColor;
//    [label sizeToFit];
//    label.center = self.view.center;
//    [self.view addSubview:label];
//    @weakify(self);
//    [label yy_addTapAction:^{
//        @strongify(self);
//        YYDataSetViewController *dataSetVC = [YYDataSetViewController new];
//        [self.navigationController pushViewController:dataSetVC animated:YES];
//    }];
}

- (void)setAllPropertiesValue {
    YYPerson *p1 = [YYPerson new];
    p1.name = @"P1";
    p1.age = 10;
    p1.height = 182;
    
    YYPerson *p2 = [YYPerson new];
    p2.name = @"P122";
    p2.age = 100;
    p2.height = 190;
    [p1 yy_setAllPropertiesValueToModel:p2];
}

- (void)ui {
    UIView *fView = [UIView new];
    fView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *widthCons = [NSLayoutConstraint constraintWithItem:fView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
    NSLayoutConstraint *topCons = [NSLayoutConstraint constraintWithItem:fView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:100];
    fView.center = self.view.center;
    fView.backgroundColor = UIColor.yellowColor;
    [fView yy_addSubviewsWithDirection:YYLayoutSubviewsHorizontal itemNumber:5 itemEdgeInsets:UIEdgeInsetsMake(10, 20, 50, 30) itemSpacing:10.f itemBuild:^UIView * _Nonnull(NSInteger index) {
        UILabel *label = [UILabel new];
        label.textColor = UIColor.blackColor;
        label.text = [NSString stringWithFormat:@"%ld",(long)index];
        return label;
    }];
    [self.view addSubview:fView];
    [self.view addConstraint:topCons];
    [self.view addConstraint:widthCons];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [fView yy_addSubviewsWithDirection:YYLayoutSubviewsHorizontal itemNumber:10 itemEdgeInsets:UIEdgeInsetsMake(10, 20, 50, 30) itemSpacing:10.f itemBuild:^UIView * _Nonnull(NSInteger index) {
            UILabel *label = [UILabel new];
            label.textColor = UIColor.blackColor;
            label.text = [NSString stringWithFormat:@"%ld",(long)index];
            return label;
        }];
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
