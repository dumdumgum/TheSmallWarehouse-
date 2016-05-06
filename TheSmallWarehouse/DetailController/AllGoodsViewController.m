//
//  AllGoodsViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/8.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "AllGoodsViewController.h"
#import "AllGoodsTopView.h"
#import "AllGoodsTableViewCell.h"
#import "YLLHeader.h"
#import "WarehouseDataBase.h"
#import "GoodsModel.h"
@interface AllGoodsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) AllGoodsTopView *allGoodsTopView;
@property (nonatomic, strong) UITableView *goodsTableView;
@property (nonatomic, strong) NSArray *allGoodsArray;
@end

@implementation AllGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.allGoodsTopView = [[AllGoodsTopView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight * 0.15)];
    self.allGoodsTopView.backgroundColor = kColorThree;
    [self.view addSubview:self.allGoodsTopView];

    self.goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.allGoodsTopView.frame.size.height, kWidth, kHeight - self.allGoodsTopView.frame.size.height) style:(UITableViewStylePlain)];
    self.goodsTableView.rowHeight = 125;
    [self.view addSubview:self.goodsTableView];
    
    self.allGoodsArray = [NSArray array];
    self.allGoodsArray = [[WarehouseDataBase shareWarehouseDataBase] selectAllDataWithTable];
    self.goodsTableView.delegate = self;
    self.goodsTableView.dataSource = self;

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
