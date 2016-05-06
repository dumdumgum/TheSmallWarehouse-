//
//  PurchaseTableViewController.m
//  TheSmallWarehouse
//
//  Created by Adoma's MacbookPro on 16/4/7.
//  Copyright © 2016年 鱼蛋蛋. All rights reserved.
//
#import "YLLHeader.h"
#import "PurchaseTableViewController.h"
#import "OneTableViewCell.h"
#import "GoodsTableViewController.h"
@interface PurchaseTableViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *b1;
@property (nonatomic, strong) UIButton *b2;

@property (nonatomic, copy) NSArray *a1;
@property (nonatomic, copy) NSArray *a2;
@property (nonatomic, copy) NSArray *a3;
@property (nonatomic, copy) NSArray *a4;

@property (nonatomic, copy) NSString *labelText;
@property (nonatomic, copy) NSString *labelText1;
@property (nonatomic, copy) NSString *labelText2;
@property (nonatomic, copy) NSString *labelText3;
@property (nonatomic, copy) NSString *textFiledText;
@property (nonatomic, copy) NSString *textFiledText1;
@property (nonatomic, copy) NSString *textFiledText2;
@property (nonatomic, copy) NSString *textFiledText3;

@end

@implementation PurchaseTableViewController
- (NSArray *)a1 {
    if (!_a1) {
        _a1 = [[NSArray alloc] init];
    }
    return _a1;
}
- (NSArray *)a2 {
    if (!_a2) {
        _a2 = [[NSArray alloc] init];
    }
    return _a2;
}
- (NSArray *)a3 {
    if (!_a3) {
        _a3 = [[NSArray alloc] init];
    }
    return _a3;
}
- (NSArray *)a4 {
    if (!_a4) {
        _a4 = [[NSArray alloc] init];
    }
    return _a4;
}

- (instancetype)init {
    return [super initWithStyle:(UITableViewStyleGrouped)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.a1 = @[@"供应商",@"仓库"];
    self.a2 = @[@"默认供应商",@"默认仓库"];
    self.a3 = @[@"付款",@"业务日期"];
    self.a4 = @[@"00.00",@"2016-01-01"];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OneTableViewCell *cell = [[OneTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"purchaseCell"];
    [cell setTextChangedBlock:^(NSString *labelText, NSString *textFiled) {
        if ([labelText isEqualToString:@"供应商"]) {
            self.textFiledText = textFiled;
            self.labelText = labelText;
        }else if ([labelText isEqualToString:@"仓库"]) {
            self.textFiledText1 = textFiled;
            self.labelText1 = labelText;
        }else if ([labelText isEqualToString:@"付款"]) {
            self.textFiledText2 = textFiled;
            self.labelText2 = labelText;
        }else if ([labelText isEqualToString:@"业务日期"]) {
            self.textFiledText3 = textFiled;
            self.labelText3 = labelText;
        }
    }];
    
    if (indexPath.section == 0) {
        cell.lable.text = self.a1[indexPath.row];
        cell.textFiled.placeholder = self.a2[indexPath.row];
        return cell;
    }else if (indexPath.section == 1) {
        UITableViewCell *twoCell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"two"];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
            self.label.text = @"选择商品";
            [twoCell addSubview:self.label];
        }else {
            self.b1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
            self.b1.frame = CGRectMake(0, 0, 30, 30);
            [self.b1 setImage:[UIImage imageNamed:@"saomiao副本"] forState:normal];
            [self.b1 addTarget:self action:@selector(addGoods) forControlEvents:(UIControlEventTouchUpInside)];
            [twoCell addSubview:self.b1];
            
            self.b2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
            self.b2.frame = CGRectMake(60, 0, 30, 30);
            [self.b2 setImage:[UIImage imageNamed:@"main04"] forState:normal];
            [self.b2 addTarget:self action:@selector(chooseGoods) forControlEvents:(UIControlEventTouchUpInside)];
            [twoCell addSubview:self.b2];
        }
        return twoCell;
    }else {
        cell.lable.text = self.a3[indexPath.row];
        cell.textFiled.placeholder = self.a4[indexPath.row];
        cell.textFiled.keyboardType = UIKeyboardTypeNumberPad;
        return cell;

    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (void)addGoods {
    NSLog(@"ddddddddddd");
}
- (void)chooseGoods {
    GoodsTableViewController *goodsTVC = [[GoodsTableViewController alloc] init];
    goodsTVC.textFiledText = self.textFiledText;
    goodsTVC.textFiledText1 = self.textFiledText1;
    goodsTVC.textFiledText2 = self.textFiledText2;
    goodsTVC.textFiledText3 = self.textFiledText3;

    [self.navigationController pushViewController:goodsTVC animated:YES];
}
@end
