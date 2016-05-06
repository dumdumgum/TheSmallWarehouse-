//
//  IntoWarehouseViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/3/31.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//
#import "YLLHeader.h"
#import "IntoWarehouseViewController.h"
#import "PurchaseTableViewController.h"
#import "MyButton.h"
#import "WarehouseDataBase.h"
#import "AllGoodsTableViewCell.h"

@interface IntoWarehouseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) MyButton *b1;
@property (nonatomic, strong) MyButton *b2;
@property (nonatomic, strong) MyButton *b3;
@property (nonatomic, strong) MyButton *b4;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *allGoodsArray;

@end

@implementation IntoWarehouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhiteColor;
    [self showTopView];
    
    UIBarButtonItem *rightBI = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(tapGR)];
    self.navigationItem.rightBarButtonItem = rightBI;
    self.allGoodsArray = [NSArray array];
    self.allGoodsArray = [[WarehouseDataBase shareWarehouseDataBase] selectAllDataWithTable];
    NSLog(@"%@",self.allGoodsArray);
    
    self.b1 = [[MyButton alloc] initWithFrame:kFrameBOne corners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 20)];
    [self.b1 setTitle:@"默认" forState:(UIControlStateNormal)];
    [self.b1 addTarget:self action:@selector(myButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.topView addSubview:self.b1];
    
    self.b2 = [[MyButton alloc] initWithFrame:kFrameBTwo corners:UIRectCornerTopLeft cornerRadii:CGSizeMake(0, 0)];
    [self.b2 setTitle:@"已采购" forState:(UIControlStateNormal)];
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 125;
    [self.view addSubview:self.tableView];

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
    PurchaseTableViewController *puechaseTVC = [[PurchaseTableViewController alloc] init];
    [self.navigationController pushViewController:puechaseTVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allGoodsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AllGoodsTableViewCell *cell = [[AllGoodsTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"allGoodsCell"];
    cell.goodsModel = self.allGoodsArray[indexPath.row];
    return cell;
}


@end
