//
//  JingYingViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/28.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "JingYingViewController.h"
#import "OneView.h"
#import "YLLHeader.h"
@interface JingYingViewController ()
@property (nonatomic, strong) OneView *oneView1;
@property (nonatomic, strong) OneView *oneView2;
@property (nonatomic, strong) OneView *oneView3;
@property (nonatomic, strong) OneView *oneView4;
@end

@implementation JingYingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:235/256.0 green:235/256.0 blue:241/256.0 alpha:1];
    UIScrollView *sView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    sView.contentSize = CGSizeMake(kWidth, 700);
    sView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:sView];
    _oneView1 = [[[NSBundle mainBundle] loadNibNamed:@"OneView" owner:nil options:nil] firstObject];
    _oneView2 = [[NSBundle mainBundle] loadNibNamed:@"OneView" owner:nil options:nil][1];
    _oneView3 = [[NSBundle mainBundle] loadNibNamed:@"OneView" owner:nil options:nil][2];
    _oneView4 = [[[NSBundle mainBundle] loadNibNamed:@"OneView" owner:nil options:nil] lastObject];
    _oneView1.frame = CGRectMake(0, 0, kWidth, 124);
    _oneView2.frame = CGRectMake(0, 134, kWidth, 106);
    _oneView3.frame = CGRectMake(0, 250, kWidth, 123);
    _oneView4.frame = CGRectMake(0, 383, kWidth, 249);
    [sView addSubview:_oneView1];
    [sView addSubview:_oneView2];
    [sView addSubview:_oneView3];
    [sView addSubview:_oneView4];
}

@end
