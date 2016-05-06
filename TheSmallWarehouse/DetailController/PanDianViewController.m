//
//  PanDianViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/16.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "PanDianViewController.h"
#import "YLLHeader.h"
#import "TopButtonView.h"
@interface PanDianViewController ()
@property (nonatomic, strong)TopButtonView *topButtonView;
@end

@implementation PanDianViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
