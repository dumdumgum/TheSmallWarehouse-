//
//  WillChudanTableViewController.m
//  TheSmallWarehouse
//
//  Created by GumGum on 16/4/23.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//

#import "WillChudanTableViewController.h"
#import "AllGoodsTableViewCell.h"
#import "WillChudanGoodsView.h"
#import "YLLHeader.h"
#import "WarehouseDataBase.h"
@interface WillChudanTableViewController ()
@property (nonatomic,strong) WillChudanGoodsView *willChundanGoodsView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UIView *grayView;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *num;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *color;
@property (nonatomic, copy) NSString *size;
@end

@implementation WillChudanTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 125;
    [self.tableView addSubview:self.willChundanGoodsView];
    self.array = [NSArray array];
    self.array = [[WarehouseDataBase shareWarehouseDataBase] selectAllDataWithTable];
    
    self.grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    self.grayView.backgroundColor = [UIColor grayColor];
    self.grayView.alpha = 0;
    [self.tableView addSubview:self.grayView];
    
    self.willChundanGoodsView = [[[NSBundle mainBundle] loadNibNamed:@"WillChudanGoodsView" owner:nil options:nil] lastObject];
    self.willChundanGoodsView.frame = CGRectMake(kWidth, kHeight-464, kWidth, 400);
    [self.tableView addSubview:self.willChundanGoodsView];
    
    [self.willChundanGoodsView.sureButton addTarget:self action:@selector(sureAction) forControlEvents:(UIControlEventTouchUpInside)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AllGoodsTableViewCell *cell = [[AllGoodsTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"willChudanCell"];
    cell.goodsModel = self.array[indexPath.row];
    return cell;
}
- (void)sureAction {
    self.willChundanGoodsView.frame = CGRectMake(kWidth, kHeight-464, kWidth, 400);
    self.grayView.alpha = 0;
    self.tableView.scrollEnabled = YES;
    if (self.delagate && [self.delagate respondsToSelector:@selector(sendName:color:size:price:)]) {
        [self.delagate sendName:self.willChundanGoodsView.nameLabel.text color:self.willChundanGoodsView.colorLabel.text size:self.willChundanGoodsView.sizeLabel.text price:self.willChundanGoodsView.priceLabel.text];
    }
    NSLog(@"self.delagate%@",self.delagate);
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AllGoodsTableViewCell *cell = (AllGoodsTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    self.willChundanGoodsView.nameLabel.text = cell.goodsModel.name;
    self.willChundanGoodsView.numLabel.text = cell.goodsModel.goodsNum;
    self.willChundanGoodsView.priceLabel.text = [NSString stringWithFormat:@"￥%@",cell.goodsModel.sellPrice];
    self.willChundanGoodsView.colorLabel.text = cell.goodsModel.goodsColor;
    self.willChundanGoodsView.sizeLabel.text = cell.goodsModel.goodsSize;
    [UIView animateWithDuration:1 animations:^{
        self.willChundanGoodsView.frame = CGRectMake(0, kHeight-464, kWidth, 400);
    }];
    self.grayView.alpha = 0.5;
    self.tableView.scrollEnabled = NO;
}
@end
