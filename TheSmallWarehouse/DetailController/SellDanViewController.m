//
//  SellDanViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/18.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "SellDanViewController.h"
#import "MyButton.h"
#import "YLLHeader.h"
#import "GetMoneyTableViewCell.h"
#import "ChuDanViewController.h"
#import "GetMoneyDataBase.h"
@interface SellDanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UIView *topView;
@property (nonatomic, strong) MyButton *b1;
@property (nonatomic, strong) MyButton *b2;
@property (nonatomic, strong) MyButton *b3;
@property (nonatomic, strong) MyButton *b4;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;
@end

@implementation SellDanViewController
- (void)viewWillAppear:(BOOL)animated {
    self.array = [NSArray array];
    self.array = [[GetMoneyDataBase shareGetMoneyDataBase] selectAllDataWithTable];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showTopView];
    self.view.backgroundColor = kWhiteColor;
    UIBarButtonItem *rightBI = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(tapGR)];
    self.navigationItem.rightBarButtonItem = rightBI;
    
    
    self.b1 = [[MyButton alloc] initWithFrame:kFrameBOne corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 20)];
    [self.b1 setTitle:@"默认" forState:(UIControlStateNormal)];
    [self.b1 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b1];
    
    self.b2 = [[MyButton alloc] initWithFrame:kFrameBTwo corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
    [self.b2 setTitle:@"已出售" forState:(UIControlStateNormal)];
    [self.b2 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b2];
    
    self.b3 = [[MyButton alloc] initWithFrame:kFrameBThree corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
    [self.b3 setTitle:@"草稿" forState:(UIControlStateNormal)];
    [self.b3 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b3];
    
    self.b4 = [[MyButton alloc] initWithFrame:kFrameBFour corners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    [self.b4 setTitle:@"撤销" forState:(UIControlStateNormal)];
    [self.b4 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b4];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHeight*0.06, kWidth, kHeight*0.94) style:(UITableViewStylePlain)];
    self.tableView.rowHeight = 64;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"GetMoneyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"getMoneyCell"];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}
- (void)showTopView {
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight * 0.06)];
    self.topView.backgroundColor = kColorThree;
    [self.view addSubview:self.topView];
}

- (void)myButtonAction {
    NSLog(@"mymymyjy");
}

- (void)tapGR {
    ChuDanViewController *chudanTVC = [[ChuDanViewController alloc] init];
    [self.navigationController pushViewController:chudanTVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -------tableviewcell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GetMoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"getMoneyCell" forIndexPath:indexPath];
    cell.sellModel = self.array[indexPath.row];
    return cell;
}

@end
