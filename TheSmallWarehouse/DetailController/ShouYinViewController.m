//
//  ShouYinViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/18.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "ShouYinViewController.h"
#import "YLLHeader.h"
#import "MyButton.h"
#import "GetMoneyTableViewCell.h"
@interface ShouYinViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MyButton *b1;
@property (nonatomic, strong) MyButton *b2;
@property (nonatomic, strong) UITableView *moneyTV;
@end

@implementation ShouYinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    [self showTopView];
    
    self.b1 = [[MyButton alloc] initWithFrame:kFrameBSix corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 20)];
    [self.b1 setTitle:@"已结账" forState:(UIControlStateNormal)];
    [self.b1 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b1];
    
    self.b2 = [[MyButton alloc] initWithFrame:kFrameBFive corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    [self.b2 setTitle:@"撤销" forState:(UIControlStateNormal)];
    [self.b2 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b2];
    
    self.moneyTV = [[UITableView alloc] initWithFrame:CGRectMake(0, kHeight*0.04+10, kWidth, kHeight*0.96-10)];
    [self.moneyTV registerNib:[UINib nibWithNibName:@"GetMoneyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"moneyCell"];
    self.moneyTV.delegate = self;
    self.moneyTV.dataSource = self;
    self.moneyTV.rowHeight = 64;
    [self.view addSubview:self.moneyTV];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GetMoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moneyCell" forIndexPath:indexPath];
    
    return cell;
}
- (void)showTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight * 0.06)];
    self.topView.backgroundColor = kColorThree;
    [self.view addSubview:self.topView];
}

- (void)myButtonAction {
    NSLog(@"mymymyjy");
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
