//
//  BuyViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/16.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "BuyViewController.h"
#import "YLLHeader.h"
#import "TopButtonView.h"
@interface BuyViewController ()
@property (nonatomic, strong)TopButtonView *topButtonView;
@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    self.topButtonView = [[TopButtonView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight * 0.06)];
    self.topButtonView.backgroundColor = kColorThree;
    [self.view addSubview:self.topButtonView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
