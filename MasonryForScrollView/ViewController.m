//
//  ViewController.m
//  MasonryForScrollView
//
//  Created by mac on 2020/5/19.
//  Copyright © 2020 lwb. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *mainScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.mainScrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainScrollView).inset(15.f);
        make.left.equalTo(self.mainScrollView).inset(15.f);
        make.right.equalTo(self.mainScrollView).inset(15.f);
        make.width.mas_equalTo(self.view.bounds.size.width - 30.f);
        make.bottom.equalTo(self.mainScrollView).inset(15.f);
        make.height.greaterThanOrEqualTo(@0);
    }];
    //生成View
    NSMutableArray *labelViews = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < 20; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [self RandomColor];
        label.backgroundColor = [self getRandomBackgroundColor];
        label.text = [NSString stringWithFormat:@"我是Label,索引值为:%d",i+1];
        label.font = [UIFont boldSystemFontOfSize:16.f];
        [contentView addSubview:label];
        [labelViews addObject:label];
    }
    //布局子视图
    UILabel *prev = nil;
    for (int i = 0; i < labelViews.count; i++) {
        if (!prev) {
            [labelViews[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(contentView);
                make.height.mas_equalTo(100);
            }];
        } else {
            [labelViews[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(prev.mas_bottom);
                make.left.right.equalTo(prev);
                make.height.mas_equalTo(100);
                if (i == labelViews.count - 1) {
                    make.bottom.equalTo(contentView.mas_bottom);
                }
            }];
        }
        prev = labelViews[i];
    }
}


- (UIColor *)getRandomBackgroundColor {
    CGFloat hue = (arc4random() %256/256.0);

    CGFloat saturation = (arc4random() %128/256.0) +0.5;

    CGFloat brightness = (arc4random() %128/256.0) +0.5;

    UIColor*color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    return color;
}

- (UIColor *)RandomColor {

    NSInteger aRedValue =arc4random() %255;
    NSInteger aGreenValue =arc4random() %255;
    NSInteger aBlueValue =arc4random() %255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue /255.0f green:aGreenValue /255.0f blue:aBlueValue /255.0f alpha:1.0f];

    return randColor;

}

@end
